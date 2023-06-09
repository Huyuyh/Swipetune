import 'package:get/get.dart';
import 'package:swipetune/controllers/login_controller.dart';
import 'package:swipetune/models/genre_model.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/services/request.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/utils/share_pref.dart';

class GenreDAO {
  Future<List<GenreModel>?> getGenres() async {
    try {
      final res = await ApiService.get('/Genre/GetAllGenre', {}, {});
      List<GenreModel> list = GenreModel.fromList(res.data);

      return list;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<Artist>?> getArtists() async {
    try {
      final res =
          await ApiService.get('/Artist/GetListArtistInformation', {}, {});
      List<Artist> list = Artist.fromList(res.data);

      return list;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future addAccountGenre(List<GenreModel> genres) async {
    List<Map<String, dynamic>> param = [];

    String? accountId = await Get.find<LoginController>().tmpAccountId;

    for (var element in genres) {
      param.add({"AccountId": accountId, "GenreId": element.genreId});
    }

    try {
      final res =
          await ApiService.post('/Account/AddAccountGenre', {}, {}, param);
    } catch (e) {
      print(e);
    }
  }

  Future addAccountArtist(List<Artist> artists) async {
    List<Map<String, dynamic>> param = [];

    String? accountId = await Get.find<LoginController>().tmpAccountId;

    for (var element in artists) {
      param.add({"AccountId": accountId, "GenreId": element.artistId});
    }

    try {
      final res =
          await ApiService.post('/Account/AddAccountArtist', {}, {}, param);
    } catch (e) {
      print(e);
    }
  }

  Future updateAccount() async {
    String? accountId = await Get.find<LoginController>().tmpAccountId;

    try {
      final res = await ApiService.put(
          '/Account/CheckLoginFirstTime/$accountId', {}, {}, {});
      await setAccountId(accountId);
      await Get.toNamed(Routes.getStartUp());
    } catch (e) {
      print(e);
    }
  }
}
