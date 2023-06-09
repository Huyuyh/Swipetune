import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/models/content.dart';
import 'package:swipetune/screens/swipe_test.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/home/app_bar.dart';
import 'package:swipetune/widgets/swipe_card/swipe_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SwipeTest();
  }
}
