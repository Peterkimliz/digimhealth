import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/profile/components/dob_widget.dart';
import 'package:digimhealth/screens/profile/components/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/minor_title.dart';

Widget profileSelectWidget({required context}) {
  UserController userController = Get.find<UserController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      genderWidget(),
      SizedBox(height: 20),
       dobWidget(context: context),
      SizedBox(height: 20),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MinorTitle(
                      title: "Age range", color: Colors.black, size: 17,),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() =>
                      MinorTitle(
                          title: userController.age.value == ""
                              ? "Select age"
                              : userController.age.value,
                          color: Colors.black)),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return userController.ageRnge
                          .map((e) =>
                          PopupMenuItem(
                              onTap: () {
                                userController.age.value = e;
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
        ),


    ],
  );
}