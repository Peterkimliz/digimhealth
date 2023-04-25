import 'package:cached_network_image/cached_network_image.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/profile/edit_profile.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/image_loader.dart';
import '../../widgets/minor_title.dart';
import 'components/profile_texteditting.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key}) : super(key: key) {
    userController
        .initializeTextEditingControllers(authController.currentUser.value!);
  }

  UserController userController = Get.find<UserController>();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
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
                  authController.currentUser.value!.profileImage == null
                      ? Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile.png"),
                                  fit: BoxFit.cover)))
                      : Container(
                          width: 60.0,
                          height: 60.0,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${authController.currentUser.value!.profileImage!}",
                            imageBuilder: (context, imageProvider) => Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                )),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    imageLoader(width: 50.0, height: 50.0),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MajorTitle(
                        title: "${authController.currentUser.value?.username}"
                            .capitalize!,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(
                          title: "${authController.currentUser.value?.phone}",
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 2,
                      ),
                      MinorTitle(
                          title: "${authController.currentUser.value?.email}",
                          size: 16,
                          color: Colors.grey),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
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
