import 'package:cached_network_image/cached_network_image.dart';
import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/models/category_model.dart';
import 'package:digimhealth/models/user_model.dart';
import 'package:digimhealth/screens/appointments/book_appointment.dart';
import 'package:digimhealth/screens/doctor/all_clinics.dart';
import 'package:digimhealth/screens/doctor/doctor_profile.dart';
import 'package:digimhealth/screens/doctor/doctors.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/clinic_card.dart';
import 'package:digimhealth/widgets/image_loader.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../notifications/notifications.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();
  AppointmentController appointmentController =
      Get.find<AppointmentController>();
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().callinit();
    return Obx(() => RefreshIndicator(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          authController.currentUser.value!.profileImage == null
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/profile.png"),
                                          fit: BoxFit.cover)))
                              : Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${authController.currentUser.value!.profileImage!}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            )),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        imageLoader(width: 50.0, height: 50.0),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MajorTitle(
                                title:
                                    "Hi ${authController.currentUser.value?.username!} ",
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              MinorTitle(
                                  title: "How're you today",
                                  color: Colors.black),
                            ],
                          ),
                          Spacer(),
                          commonWidget(
                            icon: Icons.notifications_none_outlined,
                            onPressed: () => Get.to(
                              () => Notifications(),
                            ),
                            color: Styles.mainColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    MajorTitle(
                      title: "Specialists",
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Obx(() {
                        return Get.find<HomeController>()
                                .loadingCategories
                                .value
                            ? ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 80.0,
                                    height: 50.0,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.2),
                                      highlightColor:
                                          Colors.grey.withOpacity(0.3),
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 5),
                                        margin: EdgeInsets.only(
                                            right: 10, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 2,
                                                  offset: Offset(1, 1),
                                                  color: Colors.grey)
                                            ]),
                                      ),
                                    ),
                                  );
                                })
                            : ListView.builder(
                                itemCount: Get.find<HomeController>()
                                    .categories
                                    .length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  CategoryModel categoryModel =
                                      Get.find<HomeController>()
                                          .categories
                                          .elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      appointmentController.selectedCategory
                                          .value = categoryModel;
                                      userController.searchDoctors(
                                          category: appointmentController
                                              .selectedCategory.value!.id,
                                          name: "",
                                          pageNumber: 0);
                                      Get.to(() => AllDoctors());
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 5),
                                      margin: EdgeInsets.only(
                                          right: 10, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                offset: Offset(1, 1),
                                                color: Colors.grey)
                                          ]),
                                      child: Center(
                                        child: MinorTitle(
                                          title: categoryModel.name!
                                              .toString()
                                              .capitalize!,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                      }),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MajorTitle(
                          title: "Popular Doctors",
                          color: Colors.black,
                          size: 18,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AllDoctors());
                          },
                          child: MinorTitle(
                            title: "View All",
                            color: Styles.mainColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Obx(() {
                      return userController.fetchingUsers.value
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: ListView.builder(
                                  itemCount: 10,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.withOpacity(0.2),
                                        highlightColor:
                                            Colors.grey.withOpacity(0.3),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 5),
                                          margin: EdgeInsets.only(
                                              right: 10, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: ListView.builder(
                                  itemCount:
                                      userController.searchedUsers.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    UserModel usermodel = userController
                                        .searchedUsers
                                        .elementAt(index);
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => DoctorProfile());
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 5),
                                        margin: EdgeInsets.only(
                                            right: 10, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/profile.png"),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      )
                                                    : Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        child:
                                                            CachedNetworkImage(
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
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MajorTitle(
                                                        title:
                                                            "Dr .${usermodel.username}",
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
                                                      Row(
                                                        children: [
                                                          Icon(Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 18),
                                                          SizedBox(width: 5),
                                                          Row(
                                                            children: [
                                                              MinorTitle(
                                                                  title: "4.8",
                                                                  color: Colors
                                                                      .black),
                                                              SizedBox(
                                                                  width: 5),
                                                              MinorTitle(
                                                                  title:
                                                                      "(110 Reviews)",
                                                                  color: Colors
                                                                      .grey),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => BookAppointment());
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
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                    }),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MajorTitle(
                          title: "Clinics",
                          color: Colors.black,
                          size: 18,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AllClinics());
                          },
                          child: MinorTitle(
                            title: "View All",
                            color: Styles.mainColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 220,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return clinicCard(context);
                          }),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        onRefresh: () async {
          Get.find<HomeController>().callinit();
        }));
  }
}
