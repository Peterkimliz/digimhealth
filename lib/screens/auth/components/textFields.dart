import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';

Widget inputFields( {required Widget widget}) {
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
  child: widget,
    ),
  );
}
