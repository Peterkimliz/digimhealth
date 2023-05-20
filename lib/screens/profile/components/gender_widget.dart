import 'package:digimhealth/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/minor_title.dart';

Widget genderWidget(){
  UserController userController=Get.find<UserController>();
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Icon(
              Icons.people_outline,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
              MinorTitle(title: "Gender", color: Colors.black, size: 17,),
            )
          ],
        ),
      ),
      SizedBox(height: 5),
      Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return MinorTitle(
                  title: userController.gender.value == ""
                      ? "Select Gender"
                      : userController.gender.value,
                  color: Colors.black);
            }),

            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return userController.genders
                    .map((e) =>
                    PopupMenuItem(
                        onTap: () {
                          userController.gender.value = e;
                        },
                        child: MinorTitle(
                            title: e, color: Colors.black)))
                    .toList();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ],
        ),
      )
    ],
  );
}