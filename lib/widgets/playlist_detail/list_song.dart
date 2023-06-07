import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/song_controller.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/playlist_detail/song.dart';

class ListSong extends StatelessWidget {
  ListSong({Key? key, required this.listId}) : super(key: key);

  final String? listId;

  final SongController _songController = Get.put(SongController());

  @override
  Widget build(BuildContext context) {
    _songController.getPlaylistSongs(listId!);
    return Container(
      padding: sPadding(),
      child: Obx(() => _songController.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ..._songController.listSong
                    .map((e) => Song(song: e,))
                    .toList()
              ],
            )),
    );
  }
}