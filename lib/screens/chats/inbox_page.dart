import 'package:digimhealth/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/chat_model.dart';
import '../../widgets/major_title.dart';

class InboxPage extends StatelessWidget {
  InboxPage({Key? key}) : super(key: key);
  List<ChatData> data = [
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
    ChatData("Hi, good afternoon Dr. Peter i have an immune problem", "sender",
        "11 Feb 2023 "),
    ChatData("Hi, good afternoon how can i help you john", "receiver",
        "11 Feb 2023"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.6,
          titleSpacing: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "assets/images/doctor4.jpg",
                ),
              ),
              SizedBox(width: 5),
              MajorTitle(
                title: "Dr. Peter Lojis",
                color: Colors.black,
                size: 20,
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                ChatData chatData = data.elementAt(index);
                return Align(
                    alignment: chatData.recipient == "sender"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: chatData.recipient == "sender"
                        ? Container(
                            decoration: BoxDecoration(
                                color: Styles.mainColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20, right: 5),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chatData.message,
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(chatData.date,
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20, right: 5),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chatData.message,
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(chatData.date,
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              ],
                            ),
                          ));
              }),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 10),
            child: Container(
              height: kBottomNavigationBarHeight,
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Say Something",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ));
  }
}
