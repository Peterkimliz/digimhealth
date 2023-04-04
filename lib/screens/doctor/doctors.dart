import 'package:digimhealth/controllers/appointment_controler.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/back_button.dart';
import '../appointments/book_appointment.dart';

class AllDoctors extends StatelessWidget {
  AllDoctors({Key? key}) : super(key: key);
  AppointmentController appointmentController =
      Get.find<AppointmentController>();
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
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Doctors", color: Colors.black),
        backgroundColor: Colors.white,
        leading: backButton(icon: Icons.arrow_back),
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
                child: ListView.builder(
                    itemCount: specialist.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          appointmentController.selectedCategory.value = index;
                        },
                        child: Obx(() {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                            margin:
                                EdgeInsets.only(right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: appointmentController
                                            .selectedCategory.value ==
                                        index
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
                                title: specialist[index],
                                color: appointmentController
                                            .selectedCategory.value ==
                                        index
                                    ? Colors.white
                                    : Colors.black,
                                size: 16,
                              ),
                            ),
                          );
                        }),
                      );
                    }),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
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
                                      MinorTitle(
                                          title: "Works at: Newyork,USA",
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
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 18),
                                    SizedBox(width: 5),
                                    Row(
                                      children: [
                                        MinorTitle(
                                            title: "4.8", color: Colors.black),
                                        SizedBox(width: 5),
                                        MinorTitle(
                                            title: "(110)", color: Colors.grey),
                                      ],
                                    ),
                                  ],
                                )),
                                SizedBox(width: 10),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => BookAppointment());
                                    },
                                    child:Container(
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
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
