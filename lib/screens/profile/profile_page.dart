import 'package:cached_network_image/cached_network_image.dart';
import 'package:digimhealth/controllers/authController.dart';
import 'package:digimhealth/screens/doctor/favourite_page.dart';
import 'package:digimhealth/screens/profile/about_page.dart';
import 'package:digimhealth/screens/profile/faqs_page.dart';
import 'package:digimhealth/screens/profile/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/image_loader.dart';
import '../../widgets/major_title.dart';
import '../../widgets/minor_title.dart';
import 'help_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

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
                    authController.currentUser.value!.profileImage == null
                        ? Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.png"),
                                    fit: BoxFit.cover)))
                        : Container(
                            width: 60.0,
                            height: 60.0,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${authController.currentUser.value!.profileImage!}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      )),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      imageLoader(width: 50.0, height: 50.0),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MajorTitle(
                          title:
                              "${authController.currentUser.value?.username!}"
                                  .capitalize!,
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(
                          title: "${authController.currentUser.value?.phone}",
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        MinorTitle(
                            title: "${authController.currentUser.value?.email}",
                            color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                profileItems(
                    title: "My Profile",
                    icon: Icons.person,
                    color: Colors.deepPurpleAccent,
                    onPressed: () => Get.to(() => ProfileDetails(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 1000))),
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
                    onPressed: () {
                      Get.to(() => AboutPage());
                    }),
                SizedBox(height: 10),
                profileItems(
                    title: "FAQS",
                    icon: Icons.question_answer,
                    color: Colors.blueAccent,
                    onPressed: () {
                      Get.to(() => FaqsPage());
                    }),
                profileItems(
                    title: "Help Center",
                    icon: Icons.help,
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Get.to(() => HelpPage());
                    }),
                profileItems(
                    title: "Log out",
                    icon: Icons.logout,
                    color: Colors.redAccent,
                    onPressed: () {
                      authController.logout();
                    }),
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
              fontWeight: FontWeight.w600,
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
