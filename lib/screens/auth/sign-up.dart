import 'package:digimhealth/screens/auth/login.dart';
import 'package:digimhealth/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/authController.dart';
import '../../utils/styles.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_painter.dart';
import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                        top: 100,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MajorTitle(
                              title: "Sign Up",
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(height: 10),
                            MinorTitle(
                                title: "Please sign in to continue.",
                                color: Colors.grey,size: 16,fontWeight: FontWeight.w600,),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Material(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: authController.textEditingControllerName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                        hintText: "Full name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Styles.mainColor,
                        ),
                      ),
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0)
                      .copyWith(top: 15),
                  child: Material(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: authController.textEditingControllerPhone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        hintText: "Phone",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Styles.mainColor,
                        ),
                      ),
                    ),
                  ),
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
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return authController.authUserLoad.value
                        ? Loader()
                        : InkWell(
                            onTap: () {
                              if (authController.isValidated()) {
                                authController.createUser(context);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(new SnackBar(
                                  content: MinorTitle(
                                      title: authController.errorMessage.value,
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
                                  MajorTitle(
                                      title: "Sign Up", color: Colors.white),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MinorTitle(
                      title: "Already have an account?",
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginPage(),transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 1000));
                      },
                      child: MajorTitle(
                          title: "Sign In", color: Styles.mainColor, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
