import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  RxInt selectedCategory = RxInt(0);
  RxInt selectedAppointmentType=RxInt(0);
  RxString cancelValue=RxString("");
  RxString resheduleValue=RxString("");


  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    // TODO: implement onInit
  }
}
