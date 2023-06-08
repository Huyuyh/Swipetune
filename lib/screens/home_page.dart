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
    // Scaffold(
    //   // appBar: AppBar(),
    //   body: SafeArea(child: Obx(() {
    //     if (controller.isLoading) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     return Container(
    //       padding: sPadding(),
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 560,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(20),
    //               child: SwipeCards(
    //                 matchEngine: controller.matchEngine!,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return SwipeCard(song: controller.songModels[index]);
    //                 },
    //                 onStackFinished: () {
    //                   Get.snackbar(
    //                     "Stack Finished",
    //                     "",
    //                     duration: Duration(milliseconds: 500),
    //                   );
    //                 },
    //                 leftSwipeAllowed: true,
    //                 rightSwipeAllowed: true,
    //                 upSwipeAllowed: false,
    //                 fillSpace: true,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 28,
    //           ),
    //           Align(
    //             alignment: Alignment.bottomCenter,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 GestureDetector(
    //                   onTap: controller.nope,
    //                   child: Container(
    //                       width: 68,
    //                       height: 68,
    //                       child: Image.asset("assets/images/unlike_icon.png")),
    //                 ),
    //                 GestureDetector(
    //                   onTap: play,
    //                   child: Container(
    //                       width: 83,
    //                       height: 83,
    //                       child: Image.asset("assets/images/play_icon.png")),
    //                 ),
    //                 GestureDetector(
    //                   onTap: controller.like,
    //                   child: Container(
    //                       width: 68,
    //                       height: 68,
    //                       child: Image.asset("assets/images/like_icon.png")),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             height: 28,
    //           ),
    //         ],
    //       ),
    //     );
    //   })),
    // );
  }

  void play() {
    controller.playSong("3UmaczJpikHgJFyBTAJVoz");
  }
}
