import 'package:digimhealth/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  RxString cancelValue = RxString("");
  RxString resheduleValue = RxString("");
  RxString selectedHour = RxString("");
  Rxn<CategoryModel> selectedCategory = Rxn(null);
  RxString selectedDate=RxString("");
  RxString selectedTime=RxString("");
  RxInt selectedDuration=RxInt(30);
  List <String>durations=["30","60","90","120","150","180","210"];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    // TODO: implement onInit
  }
}
