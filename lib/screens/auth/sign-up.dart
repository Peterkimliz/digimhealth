import 'package:digimhealth/screens/auth/components/textFields.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authController.dart';
import '../../widgets/custom_button.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Image.asset(""),
            // ),
            SizedBox(height: 100),
            inputFields(
                title: "Full name",
                icon: Icons.person,
                controller: authController.textEditingControllerName),
            inputFields(
                title: "Email",
                icon: Icons.email,
                controller: authController.textEditingControllerEmail),
            inputFields(
                title: "Phone",
                icon: Icons.phone,
                controller: authController.textEditingControllerPhone),
            inputFields(
                title: "Password",
                icon: Icons.lock,
                isPassword: true,
                controller: authController.textEditingControllerPassword,
                isVisible: true),
            SizedBox(
              height: 20,
            ),
            customButton(
                callback: () {
                  Get.to(() => Home());
                },
                title: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
