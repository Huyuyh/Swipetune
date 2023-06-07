import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:swipetune/widgets/bottom_sheet/bottom_sheet_create_new_playlist.dart';
import 'package:swipetune/widgets/button/button_large.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/home/app_bar_create_playlist.dart';
import 'package:swipetune/widgets/my_library/list_playlist.dart';
import 'package:swipetune/widgets/my_library/playlist.dart';
import 'package:swipetune/widgets/playlist_playing/playlist_playing_app_bar.dart';

class BottomSheetAddToPlayList extends StatelessWidget {
  const BottomSheetAddToPlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AddToPlayListAppBar(context),
        body: Center(
          child: Column(
            children: [
              SolidButtonSmall(
                label: "New playlist",
                color: Color(0xffFF7D87),
                onTap: () {
                  Get.bottomSheet(
                      isScrollControlled: true, BottomSheetCreatePlayList());
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: ListPlayList())),
            ],
          ),
        ),
      ),
    );
  }
}
