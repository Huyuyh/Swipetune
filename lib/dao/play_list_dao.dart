import 'package:swipetune/models/play_list_model.dart';
import 'package:swipetune/services/request.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/share_pref.dart';
import 'package:intl/intl.dart';

class PlayListDA0 {
  Future<List<PlayListModel>?> getPlayLists() async {
    String? accountId = await getAccountID();

    try {
      final res = await ApiService.get(
          '/PlayList/GetAccountPlaylist?id=${accountId}', {}, {});
      List<PlayListModel> list = PlayListModel.fromList(res.data);

      return list;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future createNewPlayList(String name) async {
    final id = await getAccountID();

    Map<String, dynamic> param = {
      "AccountId": id,
      "Name": name,
      "Created": formatDate(DateTime.now()),
      "playlist_img_url": "string",
      "isPublic": true
    };

    try {
      final res = await ApiService.post(
          '/PlayList/CreatePlaylist', {}, {}, param);
      if (res.statusCode == 200) {}
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addMusicToPlayList(
      String songId, List<String> playListIds) async {
    String url = '/PlayList/AddTrackToPlaylist?trackIds=$songId';
    for (var id in playListIds) {
      url += '&playlistIds=$id';
    }

    try {
      final res = await ApiService.post(url, {}, {}, {});
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future syncPlayListToSpotfiy(String playListId) async {
    String? accessToken = await getAccessToken();
    String url = '/PlayList/SyncPlaylist/$playListId?accessToken=$accessToken';
    try {
      final res = await ApiService.post(url, {}, {}, {});
    } catch (e) {
      print(e);
    }
  }
}
