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
      appBar: AppBar(),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: controller,
          builder: (controller) {
            return Container(
              padding: sPadding(),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 28,
                  // ),
                  // Container(
                  //   child: MyAppBar(),
                  // ),
                  Container(
                    height: 564,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SwipeCards(
                        matchEngine: controller.matchEngine!,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.swipeItems[index].content.color,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/login_background_img.png"),
                                fit: BoxFit.cover, // Set the desired fit mode
                              ),
                            ),
                            // child: Text(
                            //   controller.swipeItems[index].content.text,
                            //   style: TextStyle(fontSize: 100),
                            // ),
                          );
                        },
                        onStackFinished: () {
                          Get.snackbar(
                            "Stack Finished",
                            "",
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        itemChanged: (SwipeItem item, int index) {
                          print("item: ${item.content.text}, index: $index");
                        },
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
                        // IconButton(onPressed: controller.nope, icon: Icon(Icons.delete_forever_outlined)),
                        // IconButton(onPressed: controller.superLike, icon: Icon(Icons.play_arrow)),
                        // IconButton(onPressed: controller.like, icon: Icon(Icons.favorite)),
                        GestureDetector(
                          onTap: controller.nope,
                          child: Container(
                              width: 68,
                              height: 68,
                              child:
                                  Image.asset("assets/images/unlike_icon.png")),
                        ),
                        Container(
                            width: 83,
                            height: 83,
                            child: Image.asset("assets/images/play_icon.png")),
                        GestureDetector(
                          onTap: controller.like,
                          child: Container(
                              width: 68,
                              height: 68,
                              child:
                                  Image.asset("assets/images/like_icon.png")),
                        ),

                        // ElevatedButton.icon(
                        //   onPressed: controller.nope,
                        //   icon: Icon(Icons.thumb_down),
                        //   label: Text("Nope"),
                        // ),
                        // ElevatedButton.icon(
                        //   onPressed: controller.superLike,
                        //   icon: Icon(Icons.favorite),
                        //   label: Text("Superlike"),
                        // ),
                        // ElevatedButton.icon(
                        //   onPressed: controller.like,
                        //   icon: Icon(Icons.thumb_up),
                        //   label: Text("Like"),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
