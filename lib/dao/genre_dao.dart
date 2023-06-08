


import 'package:swipetune/models/genre_model.dart';
import 'package:swipetune/services/request.dart';

class GenreDAO {
  

  Future<List<GenreModel>?> getGenre() async {

    try {
      final res = await ApiService.get(
          '/Genre', {}, {});
      List<GenreModel> list = GenreModel.fromList(res.data);

      return list;
    } catch (e) {
      print(e);
    }
    return null;
  }
}