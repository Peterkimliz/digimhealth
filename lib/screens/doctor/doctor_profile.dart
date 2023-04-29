import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/screens/doctor/components/doctor_card.dart';
import 'package:digimhealth/screens/doctor/components/reviews_card.dart';
import 'package:digimhealth/screens/doctor/reviews_page.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';
import '../appointments/book_appointment.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({Key? key}) : super(key: key) ;


  //practice licence

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                return [PopupMenuItem(child: Container())];
              })
        ],
        elevation: 0.2,
        title: MajorTitle(title: "Doctor", color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctorCard(isVisible: false),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    profileItems(
                        title: "2000+",
                        icon: Icons.people,
                        subtitle: "Patients"),
                    profileItems(
                        title: "10+", icon: Icons.work, subtitle: "Years.."),
                    profileItems(
                        title: "4.8", icon: Icons.star, subtitle: "Rating"),
                    profileItems(
                        title: "4800",
                        icon: Icons.chat_bubble,
                        subtitle: "Reviews"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MajorTitle(
                title: "About me",
                color: Colors.black,
                size: 18,
              ),
              SizedBox(height: 5),
              ReadMoreText(
                "Lorem ipsum dolor sit amet consectetur. Nulla integer viverra non hendrerit facilisis accumsan praesent proin pharetra.Lorem ipsum dolor sit amet consectetur. Nulla integer viverra non hendrerit facilisis accumsan praesent proin pharetra.Lorem ipsum dolor sit amet consectetur. Nulla integer viverra non hendrerit facilisis accumsan praesent proin pharetra. ",
                style: TextStyle(color: Colors.black54),
                moreStyle: TextStyle(
                    color: Styles.mainColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
                lessStyle: TextStyle(
                    color: Styles.mainColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              MajorTitle(
                title: "Work Time",
                color: Colors.black,
                size: 18,
              ),
              SizedBox(height: 5),
              MinorTitle(
                  title: "Monday-Friday, 8:00AM-5:00PM", color: Colors.black54),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MajorTitle(
                    title: "Reviews",
                    color: Colors.black,
                    size: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ReviewsPage());
                    },
                    child: MajorTitle(
                      title: "See All",
                      color: Styles.mainColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              reviewsCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Styles.mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.favorite,
                  color: Styles.mainColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => BookAppointment());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Styles.mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: MajorTitle(
                        title: "Book Now",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItems({required title, required icon, required subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Styles.mainColor.withOpacity(0.3), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Styles.mainColor,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        MinorTitle(title: title, color: Styles.mainColor),
        SizedBox(
          height: 3,
        ),
        MinorTitle(title: subtitle, color: Colors.black),
      ],
    );
  }
}
