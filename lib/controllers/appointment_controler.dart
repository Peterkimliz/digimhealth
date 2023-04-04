import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  RxInt selectedCategory = RxInt(0);
  RxInt selectedAppointmentType=RxInt(0);

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    // TODO: implement onInit
  }
}
