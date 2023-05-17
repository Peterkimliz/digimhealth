import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/loader.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/back_button.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/minor_title.dart';

class BasicDetails extends StatelessWidget {
  final String id;

  BasicDetails({Key? key, required this.id}) : super(key: key) {
    homeController.getCategories();
  }

  HomeController homeController = Get.find<HomeController>();

  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10,
        leading: commonWidget(
            icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(
          title: "Basic Details",
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 10),
              CSCPicker(
                showStates: true,
                showCities: true,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                currentCountry: "Country",
                currentState: "State",
                currentCity: "City",
                countrySearchPlaceholder: "country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",
                countryDropdownLabel: "Country",
                stateDropdownLabel: "State",
                cityDropdownLabel: "City",
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  if (value != null) {
                    userController.country.value = value;

                  }
                },
                onStateChanged: (value) {
                  if (value != null) {
                    userController.county.value = value;

                  }
                },
                onCityChanged: (value) {
                  if (value != null) {
                    userController.subcounty.value = value;
                    print(userController.subcounty.value);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              MajorTitle(title: "Specialization Field", color: Colors.black),
              SizedBox(height: 10),
              Obx(() {
                return Get.find<HomeController>().loadingCategories.value
                    ? Container(
                        height: 50,
                        child: ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 80.0,
                                height: 50.0,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.2),
                                  highlightColor: Colors.grey.withOpacity(0.3),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                    margin: EdgeInsets.only(
                                        right: 10, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              offset: Offset(1, 1),
                                              color: Colors.grey)
                                        ]),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: homeController.categories
                            .map((element) => InkWell(
                                  onTap: () {
                                    if (userController.serviceOffered
                                            .indexWhere(
                                                (e) => e.id == element.id) ==
                                        -1) {
                                      userController.serviceOffered
                                          .add(element);
                                      userController.serviceOffered.refresh();
                                    } else {
                                      userController.serviceOffered.removeWhere(
                                          (e) => e.id == element.id);
                                      userController.serviceOffered.refresh();
                                    }
                                  },
                                  child: Chip(
                                      backgroundColor: userController
                                                  .serviceOffered
                                                  .indexWhere((e) =>
                                                      e.id == element.id) ==
                                              -1
                                          ? Colors.grey.withOpacity(0.3)
                                          : Styles.mainColor,
                                      label: MinorTitle(
                                        title: element.name!.capitalize!,
                                        color: userController.serviceOffered
                                                    .indexWhere((e) =>
                                                        e.id == element.id) ==
                                                -1
                                            ? Colors.black
                                            : Colors.white,
                                        size: 16,
                                      )),
                                ))
                            .toList(),
                      );
              }),
              SizedBox(height: 20),
              MajorTitle(title: "Working Days", color: Colors.black),
              SizedBox(height: 10),
              Obx(() {
                return Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: userController.days
                      .map((element) => InkWell(
                            onTap: () {
                              if (userController.workingDays
                                      .indexWhere((e) => e == element) ==
                                  -1) {
                                userController.workingDays.add(element);
                                userController.workingDays.refresh();
                              } else {
                                userController.workingDays
                                    .removeWhere((e) => e == element);
                                userController.workingDays.refresh();
                              }
                            },
                            child: Chip(
                                backgroundColor: userController.workingDays
                                            .indexWhere((e) => e == element) ==
                                        -1
                                    ? Colors.grey.withOpacity(0.3)
                                    : Styles.mainColor,
                                label: MinorTitle(
                                  title: element.capitalize!,
                                  color: userController.workingDays.indexWhere(
                                              (e) => e == element) ==
                                          -1
                                      ? Colors.black
                                      : Colors.white,
                                  size: 16,
                                )),
                          ))
                      .toList(),
                );
              }),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                          allowedExtensions: ['pdf']
                  );

                  if (result != null && result.files.single.path != null) {
                    File file = File(result.files.single.path!);
                    userController.pickedFile!.value = file;
                    print("file is ${userController.pickedFile!.value!.path}");
                  }
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Styles.mainColor.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.white,
                        ),
                        MajorTitle(
                            title: "Certificate of Registration(.pdf)",
                            color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Obx(() => Center(
                child: MajorTitle(
                    title: userController.pickedFile!.value != null
                        ? userController.pickedFile!.value!.path.split('/').last
                        : "",
                    color: Colors.black),
              )),

              SizedBox(
                height: 25,
              ),
              Obx(() {
                return userController.updateLoad.value
                    ? Center(child: Loader())
                    : customButton(
                        callback: () {
                          if (userController.validateUserData() == true) {
                            userController.updateDoctor(uid: id,mailSend: true);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: MajorTitle(
                                  title: "Please fill all the fields",
                                  color: Colors.white),
                              backgroundColor: Colors.black,
                            ));
                          }
                        },
                        title: "Finish");
              })
            ],
          ),
        ),
      ),
    );
  }
}
