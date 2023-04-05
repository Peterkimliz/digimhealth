import 'package:flutter/material.dart';

import '../../../widgets/major_title.dart';

Widget profileTextEditing(
    {required TextEditingController textEditingController,
    required String label,required visible}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MajorTitle(title: label, color: Colors.black),
        SizedBox(height: 5),
        TextFormField(
          enabled: visible,
          controller: textEditingController,
          decoration: InputDecoration(
              // labelText:label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              )),
        ),
      ],
    ),
  );
}
