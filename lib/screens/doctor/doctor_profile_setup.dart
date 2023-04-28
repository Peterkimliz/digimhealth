import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/screens/doctor/components/basic_details.dart';
import 'package:digimhealth/screens/profile/components/gender_widget.dart';
import 'package:digimhealth/screens/profile/components/years_widget.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../profile/components/dob_widget.dart';
import '../profile/components/profile_image.dart';

class DoctorProfileSetUp extends StatelessWidget {
  final String id;

  DoctorProfileSetUp({Key? key, required this.id}) : super(key: key);

  ///image///about///gender// working hours
  //work experience//specialist//country////state

  //reviews//patients

  //payment
  UserController userController = Get.find<UserController>();
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 10,
          automaticallyImplyLeading: false,
          title: MajorTitle(title: "Profile Setup", color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                profileImage(context),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: genderWidget()),
                    SizedBox(width: 10),
                    Expanded(child: dobWidget(context: context)),
                  ],
                ),
                SizedBox(height: 15),
                yearsWidget(),
                SizedBox(height: 15),
                MinorTitle(
                  title: "Consultation Fee",
                  color: Colors.black,
                  size: 16,
                ),
                SizedBox(height: 3),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: userController.textEditingControllerFee,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "eg.200",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Styles.mainColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Styles.mainColor, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                MinorTitle(
                  title: "Bio",
                  color: Colors.black,
                  size: 16,
                ),
                SizedBox(height: 3),
                TextFormField(
                  controller: userController.textEditingControllerBio,
                  minLines: 8,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Type Your bio",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Styles.mainColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Styles.mainColor, width: 1),
                    ),
                  ),
                ),
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
                child: customButton(
                    callback: () {
                      if (userController.gender.value.isEmpty ||
                          userController.yearsOfExperience.value == 0 ||
                          userController.dob.value.isEmpty ||
                          userController
                              .textEditingControllerBio.text.isEmpty ||
                          userController
                              .textEditingControllerFee.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: MajorTitle(
                              title: "Please fill all the fields",
                              color: Colors.white),
                          backgroundColor: Colors.black,
                        ));
                      } else {
                        Get.to(() => BasicDetails(id: id),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 800));
                      }
                    },
                    title: "Next"),
              )),
        ));
  }
}
