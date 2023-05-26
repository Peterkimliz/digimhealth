import 'package:cached_network_image/cached_network_image.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/models/category_model.dart';
import 'package:digimhealth/models/user_model.dart';
import 'package:digimhealth/screens/doctor/doctor_profile.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/loader.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/UserController.dart';
import '../../widgets/back_button.dart';
import '../../widgets/image_loader.dart';
import '../appointments/book_appointment.dart';

class AllDoctors extends StatelessWidget {
  AllDoctors({Key? key}) : super(key: key) {}

  AppointmentController appointmentController =
      Get.find<AppointmentController>();
  HomeController homeController = Get.find<HomeController>();
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        userController.searchDoctors(category: "all", name: "", pageNumber: 0);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.2,
          title: MajorTitle(title: "Doctors", color: Colors.black),
          backgroundColor: Colors.white,
          leading: commonWidget(
              icon: Icons.arrow_back,
              onPressed: () {
                userController.searchDoctors(
                    category: "all", name: "", pageNumber: 0);
                Get.back();
              }),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    if (value != null) {
                      userController.searchDoctors(
                          category:
                              "${appointmentController.selectedCategory.value!.id}",
                          name: value,
                          pageNumber: 0);
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search...",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Obx(() {
                    return ListView.builder(
                        itemCount: homeController.categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          CategoryModel categoryModel =
                              homeController.categories.elementAt(index);
                          return InkWell(
                            onTap: () {
                              appointmentController.selectedCategory.value =
                                  categoryModel;
                              userController.searchDoctors(
                                  category:
                                      "${appointmentController.selectedCategory.value!.id}",
                                  name: "",
                                  pageNumber: 0);
                            },
                            child: Obx(() => Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  margin: EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: appointmentController
                                                  .selectedCategory.value?.id ==
                                              categoryModel.id
                                          ? Styles.mainColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            offset: Offset(1, 1),
                                            color: Colors.grey)
                                      ]),
                                  child: Center(
                                    child: MinorTitle(
                                      title: categoryModel.name!,
                                      color: appointmentController
                                                  .selectedCategory.value?.id ==
                                              categoryModel.id!
                                          ? Colors.white
                                          : Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                )),
                          );
                        });
                  }),
                ),
                SizedBox(height: 10),
                Obx(() {
                  return userController.fetchingUsers.value
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3),
                            Center(
                              child: Loader(),
                            ),
                          ],
                        )
                      : userController.searchedUsers.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.15),
                                Center(
                                  child: Image.asset(
                                    "assets/images/noitems.png",
                                    height: 130,
                                    width: 130,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                MajorTitle(
                                    title: "No specialist found!!",
                                    color: Colors.black)
                              ],
                            )
                          : ListView.builder(
                              itemCount: userController.searchedUsers.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                UserModel usermodel = userController
                                    .searchedUsers
                                    .elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => DoctorProfile(userModel: usermodel,));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                    margin: EdgeInsets.only(
                                        right: 10, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              offset: Offset(1, 1),
                                              color: Colors.grey)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            usermodel.profileImage == null
                                                ? Container(
                                                    height: 80,
                                                    width: 80,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/profile.png"),
                                                            fit: BoxFit.cover)),
                                                  )
                                                : Container(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          "${usermodel.profileImage}",
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              )),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              imageLoader(
                                                                  width: 50.0,
                                                                  height: 50.0),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MajorTitle(
                                                    title:
                                                        "Dr. ${usermodel.username}"
                                                            .capitalize!,
                                                    color: Colors.black,
                                                    size: 16,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  MinorTitle(
                                                      title: "Neurology",
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  MinorTitle(
                                                      title:
                                                          "Works at: ${usermodel.country.toString().split(" ")[4]},${usermodel.county}",
                                                      color: Colors.grey),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 3),
                                                decoration: BoxDecoration(
                                                    color: Colors.amber
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.star,
                                                        color: Colors.yellow,
                                                        size: 18),
                                                    SizedBox(width: 5),
                                                    Row(
                                                      children: [
                                                        MinorTitle(
                                                            title: "4.8",
                                                            color:
                                                                Colors.black),
                                                        SizedBox(width: 5),
                                                        MinorTitle(
                                                            title: "(110)",
                                                            color: Colors.grey),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      () => BookAppointment());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Styles.mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: MajorTitle(
                                                      title: "Book Now",
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
