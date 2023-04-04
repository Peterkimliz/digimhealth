import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/home/home.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        leading: backButton(icon: Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              MinorTitle(
                title: "Set up your profile",
                color: Colors.black,
                size: 22,
              ),
              SizedBox(height: 10),
              MinorTitle(
                title:
                    "Update your profile to connect your doctor with better impression",
                color: Colors.grey,
                size: 18,
                maxline: 2,
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Styles.mainColor,
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:
                              MinorTitle(title: "Gender", color: Colors.grey),
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
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return MinorTitle(
                              title: userController.gender.value == ""
                                  ? "Select Gender"
                                  : userController.gender.value,
                              color: Colors.grey);
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
                            color: Colors.grey,
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
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MinorTitle(
                              title: "Date of birth", color: Colors.grey),
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
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return MinorTitle(
                                title: userController.dob.value == ""
                                    ? "Select date of birth"
                                    : "${DateFormat("dd/MM/yyyy").format(userController.dob.value)}",
                                color: Colors.grey);
                          }),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
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
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MinorTitle(
                              title: "Age range", color: Colors.grey),
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
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => MinorTitle(
                            title: userController.age.value == ""
                                ? "Select age"
                                : userController.age.value,
                            color: Colors.grey)),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return userController.ageRnge
                                .map((e) => PopupMenuItem(
                                    onTap: () {
                                      userController.age.value=e;
                                    },
                                    child: MinorTitle(
                                        title: e, color: Colors.black)))
                                .toList();
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
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
