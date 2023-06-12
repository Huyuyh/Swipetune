import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/profile/avatar.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';
import 'package:swipetune/widgets/profile/date_input.dart';
import 'package:swipetune/widgets/profile/profile_detail.dart';
import 'package:swipetune/widgets/profile/profile_header.dart';
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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: sPadding(),
        child: Column(
          children: [
            ProfileHeader(),
            // Center(
            //     child: SolidButtonSmall(
            //   label: 'Next',
            //   color: Colors.pink,
            // )),
            // SizedBox(
            //   height: 24,
            // ),
            // Image.asset("assets/images/logo_premium.png")
          ],
        ),
      ),
    );
  }
}
