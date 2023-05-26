import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/components/build_email.dart';
import 'package:digimhealth/screens/auth/components/build_password.dart';
import 'package:digimhealth/screens/auth/register.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loader.dart';
import '../../widgets/minor_title.dart';

class LoginLanding extends StatelessWidget {
  LoginLanding({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.withOpacity(0.1),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Image.asset(
                "assets/images/log.png",
                // height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: MajorTitle(
                      title: "Login",
                      color: Styles.mainColor,
                      size: 25,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildEmail(
                      controller: authController.textEditingControllerEmail),
                  SizedBox(height: 20),
                  Obx(() => buildPassword(
                      hint: "Password",
                      obscured: authController.hidePasword.value,
                      controller:
                          authController.textEditingControllerPassword)),
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){

                        },
                        child: MajorTitle(
                          title: "Forgot Password?",
                          color: Styles.mainColor,
                          size: 15,
                        ),
                      )),
                  SizedBox(height: 20),
                  Obx(() {
                    return authController.authUserLoad.value
                        ? Center(child: Loader())
                        : ElevatedButton(
                            onPressed: () {
                              if (authController.textEditingControllerEmail.text
                                      .isNotEmpty &&
                                  authController.textEditingControllerPassword
                                      .text.isNotEmpty) {
                                authController.loginUser(context: context);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(new SnackBar(
                                  content: MinorTitle(
                                      title: "please fill out all fields",
                                      color: Colors.white),
                                  backgroundColor: Colors.black54,
                                ));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 0.0,
                                primary: Styles.mainColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            child: Center(
                                child: MajorTitle(
                              title: "Login",
                              color: Colors.white,
                              size: 20,
                            )));
                  }),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MajorTitle(
                        title: "Don't have an account?",
                        color: Colors.black,
                        size: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Register(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 1000));
                        },
                        child: MajorTitle(
                            title: "Register",
                            color: Styles.mainColor,
                            size: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
