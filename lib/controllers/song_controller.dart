


import 'package:get/get.dart';
import 'package:swipetune/dao/song_dao.dart';
import 'package:swipetune/models/song_model.dart';

class SongController extends GetxController {
  final _isLoading = true.obs;
  final _listSong = <SongModel>[].obs;

  bool get isLoading => _isLoading.value;
  List<SongModel> get listSong => _listSong.value;

  final SongDAO songDAO = SongDAO();


  Future getPlaylistSongs(String playListId) async {
    try {
      _isLoading.value = true;
      _listSong.value = (await songDAO.getPlayListSongs(playListId))!;
    } catch (e) {
      // Handle any errors that occurred
      print(e);
    } finally {
      _isLoading.value = false;
    }
  }
}