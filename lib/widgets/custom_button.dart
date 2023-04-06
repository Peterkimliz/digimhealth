import 'package:flutter/material.dart';

import '../utils/styles.dart';

Widget customButton({required VoidCallback callback, required title,Color? color,Color ?textColor}) {
  return Material(
    color:color!=null ?color:Styles.mainColor,
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: textColor!=null?textColor:Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
