import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/styles.dart';

Widget profileImage(context) {
  UserController userController = Get.find<UserController>();
  return Center(
    child: Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Obx(() {
          return userController.pickedImage!.value != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      FileImage(userController.pickedImage!.value!),
                )
              : CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/profile.png",
                  ),
                );
        }),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(5),
                      actionsPadding: EdgeInsets.all(0),
                      buttonPadding: EdgeInsets.all(0),
                      title: Center(
                          child: MajorTitle(
                              title: "Select Image", color: Colors.black)),
                      content: Container(
                        height: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                Get.back();
                                userController.pickImage("camera");
                              },
                              title: MajorTitle(
                                  title: "Camera", color: Colors.black),
                              leading: Icon(Icons.camera_alt_rounded),
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                userController.pickImage("gallery");
                              },
                              minVerticalPadding: 10,
                              contentPadding: EdgeInsets.all(5),
                              title: MajorTitle(
                                  title: "Gallery", color: Colors.black),
                              leading: Icon(Icons.camera),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: CircleAvatar(
              backgroundColor: Styles.mainColor,
              child: Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
