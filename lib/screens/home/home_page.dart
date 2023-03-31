import 'package:digimhealth/screens/doctor/doctor_profile.dart';
import 'package:digimhealth/screens/doctor/doctors.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/images/doctor4.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MajorTitle(
                          title: "Hi Peter ,",
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(
                            title: "How're you today", color: Colors.black),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                offset: Offset(1, 1),
                                color: Colors.grey)
                          ]),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Styles.mainColor,
                      ),
                    )
                  ],
                ),
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
              Container(
                height: 120,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DoctorProfile());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(1, 1),
                                    color: Colors.grey)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/doctor4.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MajorTitle(
                                    title: "Dr .Tonia",
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  MinorTitle(
                                      title: "Neurology", color: Colors.grey),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 18),
                                      SizedBox(width: 5),
                                      Row(
                                        children: [
                                          MinorTitle(
                                              title: "4.8",
                                              color: Colors.black),
                                          SizedBox(width: 5),
                                          MinorTitle(
                                              title: "(110 Reviews)",
                                              color: Colors.grey),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Icon(
                                    Icons.message_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 15),
              MajorTitle(
                title: "Upcoming Appointments",
                color: Colors.black,
                size: 18,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Styles.mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/doctor4.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MajorTitle(
                                          title: "Dr .Tonia",
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        MinorTitle(
                                            title: "Neurology",
                                            color: Colors.white),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      MinorTitle(
                                          title:
                                              "${DateFormat("dd MMM yyyy hh:mm a").format(DateTime.now())}",
                                          color: Colors.white),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}





