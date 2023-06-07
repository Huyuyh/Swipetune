import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/services/request.dart';
import 'package:swipetune/utils/share_pref.dart';

class SongDAO {
  Future<List<SongModel>?> getListSongRecommend() async {
    String? id = await getAccountID();

    try {
      final res = await ApiService.get(
          '/PlayList/recommendations?accountId=$id', {}, {});
      List<SongModel> list = SongModel.fromList(res.data);

      return list;
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<List<SongModel>?> getPlayListSongs(String playListId) async {
    try {
      final res = await ApiService.get(
          '/PlayList/GetPlaylistSong?playlistId=$playListId', {}, {});

      List<SongModel> list = SongModel.fromList(res.data);
      return list;
    } catch (e) {
      print(e);
    }
  }
}
