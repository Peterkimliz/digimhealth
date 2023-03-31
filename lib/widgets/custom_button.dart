import 'package:flutter/material.dart';

import '../utils/styles.dart';

Widget customButton({required VoidCallback callback, required title}) {
  return Material(
    color: Styles.mainColor,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
