import 'package:digimhealth/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPassword(
    {required TextEditingController controller, required obscured,required hint}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    obscureText: obscured,
    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      hintText:hint,
      filled: true,
      suffixIcon: InkWell(
        onTap: () {
          Get.find<AuthController>().hidePasword.value =
              !Get.find<AuthController>().hidePasword.value;
        },
        child: Icon(
          obscured==false? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
      ),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.transparent, width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.transparent, width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.transparent, width: 0),
      ),
    ),
  );
}
