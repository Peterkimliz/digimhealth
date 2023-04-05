import 'package:digimhealth/screens/doctor/favourite_page.dart';
import 'package:digimhealth/screens/profile/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';
import 'help_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
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
                          title: "Peter Lojis",
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(title: "0782015660", color: Colors.grey),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(
                            title: "peterlojis@gmail.com", color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                profileItems(
                    title: "My Profile",
                    icon: Icons.person,
                    color: Colors.deepPurpleAccent,
                    onPressed: () => Get.to(() => ProfileDetails())),
                profileItems(
                    title: "Payment Methods",
                    icon: Icons.wallet,
                    color: Colors.brown,
                    onPressed: () {}),
                profileItems(
                    title: "Favourite doctors",
                    icon: Icons.favorite,
                    color: Colors.green,
                    onPressed: () {
                      Get.to(() => FavouritePage());
                    }),
                profileItems(
                    title: "About Us",
                    icon: Icons.info,
                    color: Colors.deepOrangeAccent,
                    onPressed: () {}),
                SizedBox(height: 10),
                profileItems(
                    title: "FAQS",
                    icon: Icons.question_answer,
                    color: Colors.blueAccent,
                    onPressed: () {}),
                profileItems(
                    title: "Help",
                    icon: Icons.help,
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Get.to(() => HelpPage());
                    }),
                profileItems(
                    title: "Log out",
                    icon: Icons.logout,
                    color: Colors.redAccent,
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileItems(
      {required icon,
      required Color color,
      required title,
      required onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color.withOpacity(0.1)),
                child: Center(child: Icon(icon, size: 30, color: color))),
            SizedBox(
              width: 10,
            ),
            MinorTitle(
              title: title,
              color: Colors.grey,
              size: 17,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
