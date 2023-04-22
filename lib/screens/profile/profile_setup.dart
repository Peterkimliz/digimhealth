import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:digimhealth/screens/profile/components/profile_image.dart';
import 'package:digimhealth/screens/profile/components/profile_select_widget.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';

class ProfileSetup extends StatelessWidget {
  ProfileSetup({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        title:MajorTitle(
          title: "Set up your profile",
          color: Colors.black,
          size: 20,
        ) ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              profileImage(context),
              SizedBox(height: 15),
              profileSelectWidget(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          height: kBottomNavigationBarHeight * 1.2,
          child: customButton(
              callback: () {
                Get.to(() => Home());
              },
              title: "Complete"),
        ),
      ),
    );
  }
}
