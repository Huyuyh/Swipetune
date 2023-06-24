import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/dao/play_list_dao.dart';
import 'package:swipetune/models/play_list_model.dart';

class AddPlayListController extends GetxController {
  final _listPlayListCheck = <String>[].obs;

  List<String> get listPlayListCheck => _listPlayListCheck.value;

  bool isPlayListAdded(String listId) => _listPlayListCheck.contains(listId);

  PlayListDA0 dao = PlayListDA0();

  void togglePlayList(String? listId) {
    if (_listPlayListCheck.contains(listId)) {
      _listPlayListCheck.remove(listId);
    } else {
      _listPlayListCheck.add(listId!);
    }
  }

  bool toggleIdAdded(PlayListModel playlist, String songId) {
    return playlist.playlistSongs!.any((song) => song.songId == songId);
  }

  void setEmptyList() {
    _listPlayListCheck.value = [];
  }

  Future syncPlayListToSpotfiy(String playListId) async {
    try {
      final premium = await Get.find<HomeController>().premiumAccount;
      if (premium == "") {
        Get.dialog(
          AlertDialog(
            title: Text('Premium'),
            content: Text(
                'You need to upgrage account to premium to sync playlist to Spotify'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        await dao.syncPlayListToSpotfiy(playListId);
        Get.back();

        Get.snackbar(
          'Success',
          'Playlist sync to spotify successfully.',
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xffFF7D87),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
