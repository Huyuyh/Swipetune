import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var dateOfBirth = DateTime.now().obs;

  chooseDay(DateTime pickedDate) {
    dateOfBirth.value = pickedDate;
    update();
  }
}
