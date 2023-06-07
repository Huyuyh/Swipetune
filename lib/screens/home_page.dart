import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/models/content.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/home/app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(child: Obx(() {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: sPadding(),
          child: Column(
            children: [
              Container(
                height: 560,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SwipeCards(
                    matchEngine: controller.matchEngine!,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(controller
                                .songModels[index].songImgUrl
                                .toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(
                                  0.5), // Adjust the opacity as desired
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller
                                  .songModels[index]
                                  .songTitle}", 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${controller
                                  .songModels[index]
                                  .artist != null 
                                  ? controller
                                  .songModels[index]
                                  .artist!.name
                                  : ""}", 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      );
                    },
                    onStackFinished: () {
                      Get.snackbar(
                        "Stack Finished",
                        "",
                        duration: Duration(milliseconds: 500),
                      );
                    },
                    // itemChanged: (SwipeItem item, int index) {
                    //   print("item: ${item.content.text}, index: $index");
                    // },
                    leftSwipeAllowed: true,
                    rightSwipeAllowed: true,
                    upSwipeAllowed: true,
                    fillSpace: true,
                    likeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                      ),
                      child: Text('Like'),
                    ),
                    nopeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text('Nope'),
                    ),
                    superLikeTag: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Text('Super Like'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: controller.nope,
                      child: Container(
                          width: 68,
                          height: 68,
                          child: Image.asset("assets/images/unlike_icon.png")),
                    ),
                    GestureDetector(
                      onTap: play,
                      child: Container(
                          width: 83,
                          height: 83,
                          child: Image.asset("assets/images/play_icon.png")),
                    ),
                    GestureDetector(
                      onTap: controller.like,
                      child: Container(
                          width: 68,
                          height: 68,
                          child: Image.asset("assets/images/like_icon.png")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
            ],
          ),
        );
      })),
    );
  }

  void play() {
    controller.playSong("3UmaczJpikHgJFyBTAJVoz");
  }
}
