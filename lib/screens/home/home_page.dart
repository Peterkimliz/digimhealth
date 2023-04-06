import 'package:digimhealth/screens/appointments/book_appointment.dart';
import 'package:digimhealth/screens/doctor/all_clinics.dart';
import 'package:digimhealth/screens/doctor/doctor_profile.dart';
import 'package:digimhealth/screens/doctor/doctors.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/clinic_card.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List specialist = [
    "Any",
    "Trauma",
    "Depression/Anxiety",
    "Marriage/family",
    "Loss/Grief",
    "Addiction/Drugs",
    "Lgbtq"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MajorTitle(
                  title: "Specialists",
                  color: Colors.black,
                  size: 18,
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: ListView.builder(
                      itemCount: specialist.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => AllDoctors());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                            child: Center(
                              child: MinorTitle(
                                title: specialist[index],
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                        );
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
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
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/doctor4.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              title: "Neurology",
                                              color: Colors.grey),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.yellow,
                                                  size: 18),
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
                                            BorderRadius.circular(10)),
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
                ),
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
    );
  }
}
