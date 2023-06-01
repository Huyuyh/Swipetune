import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/profile/avatar.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';
import 'package:swipetune/widgets/profile/date_input.dart';
import 'package:swipetune/widgets/profile/sync_area.dart';

import '../widgets/button/button_small.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController _dayController = TextEditingController();

  final TextEditingController _monthController = TextEditingController();

  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: sPadding(),
        child: Column(
          children: [
            Container(
              height: 600,
              child: Column(
                children: [
                  Avatar(),
                  CustomTextField(label: "Full name", hintText: "Type your name", initialValue: "Pham Ho Minh Huy",),
                  DateInput(),
                  CustomTextField(label: "Phone", hintText: "Type your phone number"),
                  SyncArea(),
                  
                ],
              ),
            ),
            Center(
                  child: SolidButtonSmall(
                label: 'Next',
                color: Colors.pink,
              )),
              SizedBox(height: 24,),
              Image.asset("assets/images/logo_premium.png")
          ],
        ),
      ),
    );
  }
}