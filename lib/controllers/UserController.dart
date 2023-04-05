import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxString gender = RxString("");
  Rx<DateTime> dob = Rx(DateTime.now());
  RxString age = RxString("");
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
  TextEditingController textEditingControllerphone = TextEditingController();
  TextEditingController textEditingControllerGender = TextEditingController();
  TextEditingController textEditingControllerDob = TextEditingController();
  TextEditingController textEditingControllerage = TextEditingController();

  initializeTextEditingControllers() {
    textEditingControllerGender.text = "Male";
    textEditingControllerphone.text = "07820167894";
    textEditingControllername.text = "John doe";
    textEditingControllerDob.text = "12/02/1900";
    textEditingControllerage.text = "18-25";
  }
}
