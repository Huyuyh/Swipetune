import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/my_library/playlist.dart';

class ListAddToPlayList extends StatelessWidget {
  ListAddToPlayList({Key? key, this.songId}) : super(key: key);

  final String? songId;

  final PlayListController controller = Get.find<PlayListController>();


  @override
  Widget build(BuildContext context) {
    // if (controller.playLists.isEmpty) {
    //   controller.fetchPlayLists();
    // }

    return Container(
      padding: sPadding(),
      child: Obx(() => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ...controller.playLists
                    .map((e) => PlayList(
                        playlist: e,
                        songId: songId,
                        isAdd: true,
                        // onTap: () {
                        //   controller.addPlayList(songId, e.playlistId);
                        // }
                        ))
                    .toList()
              ],
            )),
    );
  }
}
