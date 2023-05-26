import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/auth/components/build_password.dart';
import 'package:digimhealth/widgets/loader.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/minor_title.dart';
import 'components/build_email.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: MajorTitle(
          title: "Register",
          color: Colors.black,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              buildName(controller: authController.textEditingControllerName),
              SizedBox(height: 15),
              buildPhone(controller: authController.textEditingControllerPhone),
              SizedBox(height: 15),
              buildEmail(controller: authController.textEditingControllerEmail),
              SizedBox(height: 15),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Select User Type',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),
                items: authController.users
                    .map(
                      (e) => DropdownMenuItem(
                        onTap: () {
                          authController.userType.value = e;
                        },
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(height: 15),
              Obx(() => buildPassword(
                  hint: "Password",
                  controller: authController.textEditingControllerPassword,
                  obscured: authController.hidePasword.value)),
              SizedBox(height: 15),
              Obx(() => buildPassword(
                  hint: "Enter your Confirm Password",
                  controller: authController.textEditingControllerConPassword,
                  obscured: authController.hidePasword.value)),
              SizedBox(height: 30),
              Obx(() {
                return authController.authUserLoad.value
                    ? Center(child: Loader())
                    : ElevatedButton(
                        onPressed: () {
                          if (authController.isValidated()) {
                            authController.createUser(context: context);
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
                          title: "Register",
                          color: Colors.white,
                          size: 20,
                        )));
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: "Enter your Name",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    );
  }

  Widget buildPhone({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: "Enter your phone",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    );
  }
}
