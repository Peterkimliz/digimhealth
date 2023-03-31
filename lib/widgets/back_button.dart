
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backButton({required IconData icon}){
  return InkWell(
    splashColor: Colors.transparent,
    onTap: () {
      Get.back();
    },
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(width: 1, color: Colors.grey.withOpacity(0.2))),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    ),
  );
}