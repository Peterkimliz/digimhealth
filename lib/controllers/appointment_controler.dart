import 'package:digimhealth/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  // RxInt selectedAppointmentType = RxInt(0);
  RxString cancelValue = RxString("");
  RxString resheduleValue = RxString("");
  RxString selectedHour = RxString("");
  Rxn<CategoryModel> selectedCategory = Rxn(null);

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    // TODO: implement onInit
  }
}
