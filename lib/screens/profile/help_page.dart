import 'package:digimhealth/controllers/UserController.dart';
import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: MajorTitle(title: "Help", color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: userController.textEditingControlleremail,
                minLines: 8,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Type Your Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Styles.mainColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Styles.mainColor, width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Fill out the form above to send an email and one of our team members will address your question as soon as possible",
                  style: TextStyle(color: Colors.grey, fontSize: 15)),
              SizedBox(height: MediaQuery.of(context).size.width * 0.5),
              customButton(callback: () {}, title: "Send mail"),
            ],
          ),
        ),
      ),
    );
  }
}
