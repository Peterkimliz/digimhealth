import 'package:digimhealth/utils/styles.dart';
import 'package:digimhealth/widgets/minor_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/major_title.dart';
import 'inbox_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0.0,
        title: MajorTitle(
          title: "Chats",
          color: Colors.black,
          size: 20,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => InboxPage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Styles.mainColor,
                              radius: 31,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  "assets/images/doctor4.jpg",
                                ),
                              ),
                            ),
                            Positioned(
                              child: Icon(
                                Icons.circle,
                                color: Styles.mainColor,
                              ),
                              right: 0,
                              bottom: 0,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MajorTitle(
                              title: "Dr.Peter lojis",
                              color: Colors.black,
                              size: 16,
                            ),
                            SizedBox(height: 3),
                            MinorTitle(
                                title: "Hello how can i help you ?",
                                color: Colors.grey,
                                size: 14)
                          ],
                        ),
                        Spacer(),
                        MinorTitle(title: "2d ago", color: Colors.grey)
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
