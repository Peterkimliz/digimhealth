import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/profile/edit_profile.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/minor_title.dart';
import 'components/profile_texteditting.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key}) : super(key: key) {
    userController.initializeTextEditingControllers();
  }

  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(icon: Icons.arrow_back),
        title: MajorTitle(title: "Profile", color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              icon: Icon(
                Icons.edit,
                color: Styles.mainColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/doctor4.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MajorTitle(
                        title: "Peter Lojis",
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(title: "0782015660", color: Colors.grey),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(
                          title: "peterlojis@gmail.com", color: Colors.grey),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              MajorTitle(title: "Personal Details", color: Colors.black),
              SizedBox(height: 10),
              profileTextEditing(
                visible: false,
                  textEditingController:
                      userController.textEditingControllername,
                  label: "FullName"),
              SizedBox(height: 10),
              profileTextEditing(
                  visible: false,
                  textEditingController:
                      userController.textEditingControllerphone,
                  label: "Phone"),
              SizedBox(height: 10),
              profileTextEditing(
                  visible: false,
                  textEditingController:
                      userController.textEditingControllerage,
                  label: "Age"),
              SizedBox(height: 10),
              profileTextEditing(
                  visible: false,
                  textEditingController:
                      userController.textEditingControllerGender,
                  label: "Gender")
            ],
          ),
        ),
      ),
    );
  }


}
