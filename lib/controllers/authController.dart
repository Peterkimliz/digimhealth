import 'package:digimhealth/models/user_model.dart';
import 'package:digimhealth/screens/profile/profile_setup.dart';
import 'package:digimhealth/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/functions.dart';

class AuthController extends GetxController {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  Rxn<UserModel> currentUser = Rxn(null);
  RxBool authUserLoad = RxBool(false);
  RxString errorMessage = RxString("");

  createUser(context) async {
    try {
      authUserLoad.value = true;
      Map<String, dynamic> body = {
        "email": textEditingControllerEmail.text.trim(),
        "username": textEditingControllerName.text.trim(),
        "phone": textEditingControllerPhone.text.trim(),
        "password": textEditingControllerPassword.text.trim(),
        "type": "patient"
      };
      var response = await Auth().createUser(body: body);
      print(response);
      if (response["message"] != null) {
        showAlertDialog(context, response["message"]);
      } else {
        Get.off(() => ProfileSetup());
      }

      authUserLoad.value = false;
    } catch (e) {
      authUserLoad.value = false;
      print(e);
    }
  }

  bool isValidated() {
    if (textEditingControllerPassword.text.isEmpty ||
        textEditingControllerPhone.text.isEmpty ||
        textEditingControllerEmail.text.isEmpty ||
        textEditingControllerName.text.isEmpty) {
      errorMessage.value = "Please fill all the fields";
      return false;
    } else if (!isValidEmail(textEditingControllerEmail.text)) {
      errorMessage.value = "Enter a valid email";
      return false;
    } else {
      errorMessage.value = "";
      return true;
    }
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
