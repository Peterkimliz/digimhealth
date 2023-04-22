import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/profile/components/profile_image.dart';
import 'package:digimhealth/screens/profile/components/profile_select_widget.dart';
import 'package:digimhealth/widgets/loader.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';

class ProfileSetup extends StatelessWidget {
  final String uid;

  ProfileSetup({Key? key, required this.uid}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    print(uid);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        title: MajorTitle(
          title: "Set up your profile",
          color: Colors.black,
          size: 20,
        ),
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
        child: Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: userController.updateLoad.value
                  ? kBottomNavigationBarHeight * 1.5
                  : kBottomNavigationBarHeight * 1.2,
              child: userController.updateLoad.value
                  ? Loader()
                  : customButton(
                      callback: () {
                        if (userController.gender == "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(new SnackBar(
                                  content: MinorTitle(
                            title: "Select Gender",
                            color: Colors.white,
                          )));
                        } else if (userController.age == "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(new SnackBar(
                                  content: MinorTitle(
                            title: "Select age group",
                            color: Colors.white,
                          )));
                        } else {
                          userController.updateUser(uid: uid);
                        }
                      },
                      title: "Complete"),
            )),
      ),
    );
  }
}
