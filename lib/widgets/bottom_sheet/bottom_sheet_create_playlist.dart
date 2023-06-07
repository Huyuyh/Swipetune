import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/widgets/add_to_play_list/list_add_play_list.dart';
import 'package:swipetune/widgets/bottom_sheet/bottom_sheet_create_new_playlist.dart';
import 'package:swipetune/widgets/button/button_large.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/home/app_bar_create_playlist.dart';
import 'package:swipetune/widgets/my_library/list_playlist.dart';
import 'package:swipetune/widgets/my_library/playlist.dart';
import 'package:swipetune/widgets/playlist_playing/playlist_playing_app_bar.dart';

class BottomSheetAddToPlayList extends StatelessWidget {
  BottomSheetAddToPlayList({Key? key, required this.songId}) : super(key: key);

  final String? songId;

  final PlayListController _playListController = Get.put(PlayListController());

  final AddPlayListController _addPlayListController =
      Get.put(AddPlayListController());

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
                      child: ListAddToPlayList(
                songId: songId,
              ))),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(20),
          child: SolidButtonSmall(
              label: "Add",
              color: Color(0xff31C9CE),
              onTap: () async {
                bool isAddSuccess = await _playListController.addPlayList(songId, _addPlayListController.listPlayListCheck);
                // if(isAddSuccess) {

                //   Get.toNamed(Routes.getRootRoute());
                // }
              }),
        ),
      ),
    );
  }
}
