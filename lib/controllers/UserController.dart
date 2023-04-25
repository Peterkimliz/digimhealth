import 'dart:io';

import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/models/user_model.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:digimhealth/service/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  final _storaRef = FirebaseStorage.instance;
  Rxn<File>? pickedImage = Rxn(null);
  RxString gender = RxString("");
  RxString dob = RxString("");
  RxBool updateLoad = RxBool(false);
  RxBool loadingUserById = RxBool(false);
  RxString age = RxString("");
  RxString profileImageDownloadUrl = RxString("");
  List genders = ["Male", "Female"];
  List<String> ageRnge = [
    "18 - 25",
    "26 - 33",
    "34 - 41",
    "42 - 49",
    "50 - 57",
    "58 - 65",
    "66 - 73",
    "74 - 81",
    "82 - 89",
    "90 - 97"
  ];

  TextEditingController textEditingControllername = TextEditingController();
  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerphone = TextEditingController();
  TextEditingController textEditingControllerGender = TextEditingController();
  TextEditingController textEditingControllerDob = TextEditingController();
  TextEditingController textEditingControllerage = TextEditingController();

  initializeTextEditingControllers(UserModel userModel) {
    textEditingControllerGender.text = userModel.gender ?? "";
    textEditingControllerphone.text = userModel.phone ?? "";
    textEditingControllername.text = userModel.username ?? "";
    textEditingControllerDob.text = userModel.dob ?? "";
    textEditingControllerage.text = userModel.age ?? "";
  }

  Future pickImage(type) async {
    try {
      XFile? image = await ImagePicker().pickImage(
          source: type == "camera" ? ImageSource.camera : ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      pickedImage?.value = imageTemp;
      print("image${pickedImage!.value}");
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  updateUser({required uid}) async {
    try {
      updateLoad.value = true;
      if (pickedImage?.value != null) {
        await uploadImageToFirebaseStorage(uid);
      }
      Map<String, dynamic> body = {
        if (textEditingControllername.text.isNotEmpty)
          "username": textEditingControllername.text,
        if (textEditingControllerphone.text.isNotEmpty)
          "phone": textEditingControllerphone.text,
        "dob": dob.value,
        "gender": gender.value,
        "age": age.value,
        if (profileImageDownloadUrl.value != "")
          "profileImage": profileImageDownloadUrl.value
      };

      var response = await User().updateUser(body: body, uid: uid);
      if (response != null) {
        UserModel userModel = UserModel.fromJson(response);
        Get.find<AuthController>().currentUser.value = userModel;
        clearinputs();
        Get.off(() => Home());
      }
      updateLoad.value = false;
    } catch (e) {
      print(e);
      updateLoad.value = false;
    }
  }

  uploadImageToFirebaseStorage(uid) async {
    try {
      Reference reference = _storaRef.ref().child("profileImages").child(uid);
      UploadTask uploadTask = reference.putFile(
          pickedImage!.value!, SettableMetadata(contentType: "image/jpg"));
      TaskSnapshot taskSnapshot = await uploadTask;
      String url = await taskSnapshot.ref.getDownloadURL();
      profileImageDownloadUrl.value = url;
    } catch (e) {
      print(e);
    }
  }

  clearinputs() {
    textEditingControllerGender.clear();
    textEditingControllerDob.clear();
    textEditingControllername.clear();
    textEditingControllerphone.clear();
    textEditingControllerage.clear();
    textEditingControlleremail.clear();
    age.value = "";
    gender.value = "";
    pickedImage?.value = null;
    profileImageDownloadUrl.value = "";
  }

  getUserById(String uid) async {
    try {
      loadingUserById.value = true;
      var response = await User().getUserById(uid: uid);
      print(response);
      loadingUserById.value = false;
      if (response["message"] == null) {
        UserModel userModel = UserModel.fromJson(response);
        Get.find<AuthController>().currentUser.value = userModel;
        print("object ${userModel.type}");
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      loadingUserById.value = false;
      print("error is${e}");
    }
  }
}
