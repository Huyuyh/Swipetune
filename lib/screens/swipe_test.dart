import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/services/spotify_service.dart';
import 'package:swipetune/utils/share_pref.dart';
import 'package:swipetune/widgets/swipe_button/swipe_button.dart';
import 'package:swipetune/widgets/swipe_card/swipe_card.dart';

class SwipeTest extends StatelessWidget {
  SwipeTest({super.key});

  final AppinioSwiperController controller = AppinioSwiperController();
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Obx(() {
        if (homeController.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: AppinioSwiper(
                unlimitedUnswipe: true,
                allowUnswipe: (homeController.premiumAccount.isEmpty) ? false : true,
                controller: controller,
                unswipe: _unswipe,
                onSwiping: (AppinioSwiperDirection direction) {
                  debugPrint(direction.toString());
                },
                onSwipe: _swipe,
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 50,
                  bottom: 40,
                ),
                onEnd: _onEnd,
                cardsCount: homeController.songModels.length,
                cardsBuilder: (BuildContext context, int index) {
                  homeController
                      .setCurrentSong(homeController.songModels[index]);
                  // playMusic(homeController.songModels[index].songId.toString());
                  return SwipeCard(song: homeController.songModels[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                // swipeLeftButton(controller),
                // const SizedBox(
                //   width: 20,
                // ),
                if (homeController.isPause) ...[
                  swipePauseButton(homeController),
                ] else ...[
                  swipePlayButton(homeController),
                ],

                swipeRightButton(homeController),
                const SizedBox(
                  width: 20,
                ),
                // unswipeButton(controller),
              ],
            )
          ],
        );
      }),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) async {
    String? premium = await getPremiumAccount();
    if (index ==
        homeController.songModels.indexOf(homeController.songModels.last)) {
      homeController.fetchNewSong();
      print(homeController.songModels);
    }
    homeController.setPause(true);

    print("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      homeController.setPause(true);
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    print("end reached!");
  }
}
