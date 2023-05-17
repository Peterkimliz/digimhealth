import 'dart:io';

import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/models/category_model.dart';
import 'package:digimhealth/models/user_model.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:digimhealth/service/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/doctor/doctor_verification_page.dart';

class UserController extends GetxController {
  final _storaRef = FirebaseStorage.instance;
  Rxn<File>? pickedImage = Rxn(null);
  Rxn<File>? pickedFile = Rxn(null);
  RxString gender = RxString("");
  RxString dob = RxString("");
  RxString country = RxString("");
  RxString county = RxString("");
  RxString subcounty = RxString("");
  RxList<UserModel> searchedUsers = RxList([]);

  RxBool updateLoad = RxBool(false);
  RxBool loadingUserById = RxBool(false);
  RxBool fetchingUsers = RxBool(false);
  RxString age = RxString("");
  RxString profileImageDownloadUrl = RxString("");
  RxString certDownloadUrl = RxString("");
  RxList<CategoryModel> serviceOffered = RxList([]);
  RxList<String> workingDays = RxList([]);
  List genders = ["Male", "Female"];
  RxInt yearsOfExperience = RxInt(0);
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
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  TextEditingController textEditingControllername = TextEditingController();
  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerphone = TextEditingController();
  TextEditingController textEditingControllerGender = TextEditingController();
  TextEditingController textEditingControllerDob = TextEditingController();
  TextEditingController textEditingControllerBio = TextEditingController();
  TextEditingController textEditingControllerage = TextEditingController();
  TextEditingController textEditingControllerFee = TextEditingController();

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

    } on PlatformException catch (e) {

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

  getUserById(String uid) async {
    try {
      loadingUserById.value = true;
      var response = await User().getUserById(uid: uid);

      loadingUserById.value = false;
      if (response["message"] == null) {
        UserModel userModel = UserModel.fromJson(response);
        Get.find<AuthController>().currentUser.value = userModel;

        return userModel;
      } else {
        Get.find<AuthController>().logout()
;        return null;
      }
    } catch (e) {
      Get.find<AuthController>().logout();
      loadingUserById.value = false;
      print("error is${e}");
    }
  }

  void updateDoctor({required uid, required mailSend}) async {
    try {
      updateLoad.value = true;
      if (pickedImage?.value != null) {
        await uploadImageToFirebaseStorage(uid);
      }
      if (pickedFile?.value != null) {
        await uploadFile(uid);
      }
      Map<String, dynamic> body = {
        "mailSend": mailSend,
        if (textEditingControllername.text.isNotEmpty)
          "username": textEditingControllername.text,
        if (textEditingControllerphone.text.isNotEmpty)
          "phone": textEditingControllerphone.text,
        "dob": dob.value,
        "gender": gender.value,
        "age": age.value,
        if (profileImageDownloadUrl.value != "")
          "profileImage": profileImageDownloadUrl.value,
        if (certDownloadUrl.value != "") "certurl": certDownloadUrl.value,
        if (textEditingControllerBio.text.isNotEmpty)
          "bio": textEditingControllerBio.text,
        "country": country.value,
        "county": county.value,
        "subcounty": subcounty.value,
        "yearsOfExperience": yearsOfExperience.value,
        if (textEditingControllerFee.text.isNotEmpty)
          "consultationFee": textEditingControllerFee.text,
        if (serviceOffered.isNotEmpty)
          "category": serviceOffered.map((element) => element.id).toList(),
        if (workingDays.isNotEmpty)
          "workingDays": workingDays.map((element) => element).toList(),
      };

      var response = await User().updateDoctorDetails(body: body, uid: uid);
      if (response != null) {
        UserModel userModel = UserModel.fromJson(response);
        Get.find<AuthController>().currentUser.value = userModel;
        clearinputs();
        Get.off(() => DoctorVerificationPage());
      }
      updateLoad.value = false;

      updateLoad.value = false;
    } catch (e) {
      updateLoad.value = false;
      print(e);
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

  uploadFile(String uid) async {
    try {
      Reference reference = _storaRef.ref().child("documents").child(uid);
      UploadTask uploadTask = reference.putFile(pickedFile!.value!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      certDownloadUrl.value = downloadURL;
    } catch (e) {
      print(e);
    }
  }

  bool validateUserData() {
    if (workingDays.isEmpty ||
        serviceOffered.isEmpty ||
        country.value.isEmpty ||
        county.value.isEmpty ||
        subcounty.value.isEmpty ||
        pickedFile!.value == null) {
      return false;
    } else {
      return true;
    }
  }

  searchDoctors({required category, required name,required pageNumber}) async {
    try {
      fetchingUsers.value = true;
      var response = await User().searchDoctorDetails(category: category, pageNumber: pageNumber, name: name);

      if (response != null) {
        List users = response;
        List<UserModel> jsonResponse =
            users.map((e) => UserModel.fromJson(e)).toList();
        searchedUsers.assignAll(jsonResponse);
      } else {
        searchedUsers.value = [];
      }
      fetchingUsers.value = false;
    } catch (e) {
      fetchingUsers.value = false;
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
    textEditingControllerBio.clear();
    textEditingControllerFee.clear();
    pickedFile!.value = null;
    certDownloadUrl.value = "";
    workingDays.clear();
    serviceOffered.clear();
    county.value = "";
    subcounty.value = "";
    country.value = "";
    yearsOfExperience.value = 0;
    age.value = "";
    gender.value = "";
    pickedImage?.value = null;
    profileImageDownloadUrl.value = "";
  }
}
