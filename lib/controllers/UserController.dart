import 'package:get/get.dart';

class UserController extends GetxController {
  RxString gender = RxString("");
  Rx<DateTime> dob = Rx(DateTime.now());
  RxString age = RxString("");
  List genders = ["Male", "Female"];
  List <String> ageRnge = [
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
}
