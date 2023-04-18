import 'package:digimhealth/screens/doctor/components/reviews_card.dart';
import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonWidget(icon: Icons.arrow_back,
            onPressed: () {
              Get.back();
            }),
        title: MajorTitle(title: "Reviews", color: Colors.black),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 30,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reviewsCard(),
                  Divider(color: Colors.grey,)
                ],
              ),
            );
          }),
    );
  }
}
