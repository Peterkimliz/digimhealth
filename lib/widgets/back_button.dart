
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonWidget({required IconData icon,required onPressed,Color ?color}){
  return InkWell(
    splashColor: Colors.transparent,
    onTap: () {
      onPressed();
    },
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 1,
          //       offset: Offset(1, 1),
          //       color: Colors.grey)
          // ],
      ),
      child: Center(
        child: Icon(
          icon,
          color:color!=null?color: Colors.black,
        ),
      ),
    ),
  );
}