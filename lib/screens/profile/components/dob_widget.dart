import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/UserController.dart';
import '../../../widgets/minor_title.dart';

Widget dobWidget({required context}){
  UserController userController=Get.find<UserController>();
  return  Column(
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
                title: "Date of birth", color: Colors.black, size: 17,),
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
              maxTime: DateTime.now(),
              onChanged: (date) {
                print('change $date');
              },
              onConfirm: (date) {
                userController.dob.value =
                "${DateFormat("dd/MM/yyyy").format(date)}";
              },
              currentTime: DateTime.now(),
              locale: LocaleType.en);
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
                        : userController.dob.value,
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
  );




}