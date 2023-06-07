

import 'package:get/get.dart';
import 'package:swipetune/models/play_list_model.dart';

class AddPlayListController extends GetxController {
  final _listPlayListCheck = <String>[].obs;

  List<String> get listPlayListCheck => _listPlayListCheck.value;

  bool isPlayListAdded(String listId) => _listPlayListCheck.contains(listId);

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
}