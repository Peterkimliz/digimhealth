import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/sign-up.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_painter.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';
import '../../widgets/loader.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 200),
                    painter: RPSCustomPainter(),
                  ),
                  Positioned(
                    top: 10,
                    right: -5,
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 200),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    child: commonWidget(
                        icon: Icons.arrow_back,
                        onPressed: () {
                          Get.back();
                        }),
                    left: 10,
                    top: 5,
                  ),
                  Positioned(
                      top: 130,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MajorTitle(
                            title: "Login",
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(height: 10),
                          MinorTitle(
                              title: "Please sign in to continue.",
                              color: Colors.grey),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0)
                    .copyWith(top: 15),
                child: Material(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: authController.textEditingControllerEmail,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      iconColor: Styles.mainColor,
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Styles.mainColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0)
                    .copyWith(top: 15),
                child: Material(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: authController.textEditingControllerPassword,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.transparent)),
                      iconColor: Styles.mainColor,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Styles.mainColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: MajorTitle(
                    title: "Forgot Password?",
                    color: Styles.mainColor,
                    size: 17,
                  ),
                ),
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Obx(() {
                  return authController.authUserLoad.value
                      ? Loader()
                      : InkWell(
                          onTap: () {
                            if (authController.textEditingControllerEmail.text
                                    .isNotEmpty &&
                                authController.textEditingControllerPassword
                                    .text.isNotEmpty) {
                              authController.loginUser(context: context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(new SnackBar(
                                content: MinorTitle(
                                    title: "plese fill out all fields",
                                    color: Colors.white),
                                backgroundColor: Colors.black54,
                              ));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Styles.mainColor,
                                  Styles.mainColor.withOpacity(0.5)
                                ]),
                                borderRadius: BorderRadius.circular(30),
                                color: Styles.mainColor),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                MajorTitle(title: "Login", color: Colors.white),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        );
                }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MinorTitle(
                    title: "Dont have an account?",
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Signup(),
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 1000));
                    },
                    child: MajorTitle(
                        title: "Sign up", color: Styles.mainColor, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
