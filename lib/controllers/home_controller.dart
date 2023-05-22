import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipetune/models/content.dart';

class HomeController extends GetxController {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;

  List<String> names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink",
  ];
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink,
  ];

  @override
  void onInit() {
    for (int i = 0; i < names.length; i++) {
      swipeItems.add(
        SwipeItem(
          content: Content(text: names[i], color: colors[i]),
          likeAction: () {
            Get.snackbar(
              "Liked",
              names[i],
              duration: Duration(milliseconds: 500),
            );
          },
          nopeAction: () {
            Get.snackbar(
              "Nope",
              names[i],
              duration: Duration(milliseconds: 500),
            );
          },
          superlikeAction: () {
            Get.snackbar(
              "Superliked",
              names[i],
              duration: Duration(milliseconds: 500),
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          },
        ),
      );
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);

    super.onInit();
  }

  void nope() {
    matchEngine?.currentItem?.nope();
  }

  void superLike() {
    matchEngine?.currentItem?.superLike();
  }

  void like() {
    matchEngine?.currentItem?.like();
  }
}
