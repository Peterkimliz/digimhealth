import 'package:digimhealth/bindings.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/onboard/onboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthController authController = Get.put<AuthController>(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DigiMHealth",
      home: OnboardScreen(),
      initialBinding: AppBindings(),
    );
  }
}
