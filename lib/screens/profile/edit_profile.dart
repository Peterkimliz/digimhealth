import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/profile/components/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/major_title.dart';
import 'components/profile_select_widget.dart';
import 'components/profile_texteditting.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(title: "Edit Profile", color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
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
              SizedBox(height: 20),
              profileImage(context),
              SizedBox(height: 10),
              profileTextEditing(
                  visible: true,
                  textEditingController:
                      userController.textEditingControllername,
                  label: "FullName"),
              SizedBox(height: 10),
              profileTextEditing(
                  visible: true,
                  textEditingController:
                      userController.textEditingControllerphone,
                  label: "Phone"),
              SizedBox(height: 10),
              profileSelectWidget(context: context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          height: kBottomNavigationBarHeight * 1.2,
          child: customButton(callback: () {}, title: "Update"),
        ),
      ),
    );
  }
}
