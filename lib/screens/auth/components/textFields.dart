import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';

Widget inputFields({
  required String title,
  required IconData icon,
  required controller,
  bool isPassword = false,
  bool isVisible = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(offset: Offset(3, 3), blurRadius: 6, color: Colors.grey)
          ]),
      child: TextFormField(
        obscureText: isPassword ? isVisible : false,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            iconColor: Styles.mainColor,
            hintText: title,
            prefixIcon: Icon(
              icon,
              color: Styles.mainColor,
            ),
            suffixIcon: isPassword
                ? Icon(
                    Icons.remove_red_eye,
                  )
                : null),
      ),
    ),
  );
}
