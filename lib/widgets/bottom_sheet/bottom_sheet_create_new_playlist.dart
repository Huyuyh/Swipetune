import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';

class BottomSheetCreatePlayList extends StatelessWidget {
  const BottomSheetCreatePlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: sPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Give your playist a name", 
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),),
            CustomTextField(label: "", hintText: ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SolidButtonSmall(label: "Cancel", color: Color(0xff7FEDF0), onTap: Get.back,),
                SolidButtonSmall(label: "Create", color: Color(0xffFF7D87),)
              ],
            )
          ],
        ),
      ),
    );
  }
}