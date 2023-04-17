import 'package:digimhealth/widgets/back_button.dart';
import 'package:digimhealth/widgets/major_title.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/minor_title.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(icon: Icons.arrow_back),
        title: MajorTitle(title: "Payment", color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            MajorTitle(title: "Select Payment Method", color: Colors.black),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.grey)
                  ]
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.wallet,
                    color: Styles.mainColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MajorTitle(title: "Card", color: Colors.black),
                  Spacer(),
                  Radio(
                    value: false,
                    groupValue: false,
                    onChanged: (value) {},
                    fillColor:MaterialStateProperty.all(Styles.mainColor),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            customButton(callback: () {}, title: "Next"),
          ],
        ),
      ),
    );
  }
}
