import 'package:digimhealth/controllers/home_controller.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeController.pages[homeController.selectedPage.value]),
      bottomNavigationBar:Obx(()=> BottomNavigationBar(
        currentIndex: homeController.selectedPage.value,
        selectedItemColor: Styles.mainColor,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          homeController.selectedPage.value = value;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Blogs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: "Shedules"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      )),
    );
  }
}
