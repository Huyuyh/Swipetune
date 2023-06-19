import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/models/content.dart';
import 'package:swipetune/screens/swipe_test.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/home/app_bar.dart';
import 'package:swipetune/widgets/swipe_card/swipe_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AddPlayListController controller = Get.put(AddPlayListController());

  @override
  Widget build(BuildContext context) {
    return SwipeTest();
  }
}
