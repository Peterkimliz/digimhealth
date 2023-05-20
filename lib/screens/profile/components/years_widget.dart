import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/UserController.dart';
import '../../../widgets/minor_title.dart';

Widget yearsWidget() {
  UserController userController = Get.find<UserController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Icon(
              Icons.work_outline,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MinorTitle(
                title: "Experience(Yrs)",
                color: Colors.black,
                size: 17,
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
          child: Obx(() => DropdownButton<int>(
                value: userController.yearsOfExperience.value,
                hint: Text(
                  "hint",
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                items: List.generate(
                  60,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text(index.toString()),
                  ),
                ).toList()
                  ..cast<DropdownMenuItem<int>>(),
                onChanged: (item) {
                  userController.yearsOfExperience.value = item!;
                },
                isExpanded: true,
                underline: Container(),
                icon: Icon(Icons.keyboard_arrow_down),
              )),
        ),
      )
    ],
  );
}
