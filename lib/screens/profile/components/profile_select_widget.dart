import 'package:digimhealth/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/minor_title.dart';

Widget profileSelectWidget(context){
  UserController userController=Get.find<UserController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
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
                  MinorTitle(title: "Gender", color: Colors.black,size: 17,),
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
                        .map((e) => PopupMenuItem(
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
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: MinorTitle(
                      title: "Date of birth", color: Colors.black,size: 17,),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1950, 1, 5),
                  maxTime: DateTime.now(), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    userController.dob.value = date;
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return MinorTitle(
                        title: userController.dob.value == ""
                            ? "Select date of birth"
                            : "${DateFormat("dd/MM/yyyy").format(userController.dob.value)}",
                        color: Colors.black);
                  }),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
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
                      title: "Age range", color: Colors.black,size: 17,),
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
                Obx(() => MinorTitle(
                    title: userController.age.value == ""
                        ? "Select age"
                        : userController.age.value,
                    color: Colors.black)),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return userController.ageRnge
                        .map((e) => PopupMenuItem(
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
      )
    ],
  );
}