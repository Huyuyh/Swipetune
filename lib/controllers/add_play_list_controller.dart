

import 'package:get/get.dart';
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
      await dao.syncPlayListToSpotfiy(playListId);
    } catch (e) {
      print(e);
    }
  }
}