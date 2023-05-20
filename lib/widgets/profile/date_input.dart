import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/profile_controller.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';

class DateInput extends StatelessWidget {
  DateInput(
      {Key? key, this.dayController, this.monthController, this.yearController})
      : super(key: key);

  final TextEditingController? dayController;
  final TextEditingController? monthController;
  final TextEditingController? yearController;

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) {
        final selectedDate = _profileController.dateOfBirth.value;
        print(selectedDate);
        return Row(
          children: [
            Flexible(
              child: CustomTextField(
              readOnly: true,
              label: "Birthday",
              hintText: selectedDate.toString(),
              controller: dayController,
              floatingLabelBehavior: true,
              // initialValue: selectedDate.toString(),
              onTap: () => _chooseDay(context),
            )),
          ],
        );
      },
    );
  }

  _chooseDay(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      print(pickedDate);
      _profileController.chooseDay(pickedDate);
      // _profileController.dateOfBirth.value = pickedDate;
    }
  }
}
