import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';

Widget inputFields(
    {required String title,
    required IconData icon,
      required controller,
    bool isPassword = false,
    bool isVisible = false,}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
      obscureText: isPassword ? isVisible : false,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1
            )
          ), focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Styles.mainColor,
              width: 1
            )
          ),
          iconColor: Styles.mainColor,
          labelStyle: TextStyle(
            color: Styles.mainColor,
          ),
          label: Text(title),
          prefixIcon: Icon(icon, color:Styles.mainColor,),
          suffixIcon: isPassword
              ? Icon(
                  Icons.remove_red_eye,
                )
              : null),
    ),
  );
}
