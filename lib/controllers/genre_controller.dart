import 'package:get/get.dart';
import 'package:swipetune/dao/genre_dao.dart';
import 'package:swipetune/models/genre_model.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/widgets/add_to_play_list/list_add_play_list.dart';

class GenreController extends GetxController {
  final _isLoading = false.obs;
  final _listGenre = <GenreModel>[].obs;
  final _listArtist = <Artist>[].obs;

  final _listChooseGenre = <GenreModel>[].obs;
  final _listChooseArtist = <Artist>[].obs;

  bool get isLoading => _isLoading.value;
  List<GenreModel> get listGenre => _listGenre.value;
  List<Artist> get listArtist => _listArtist.value;
  List<GenreModel> get listChooseGenre => _listChooseGenre.value;
  List<Artist> get listChooseArtist => _listChooseArtist.value;

  GenreDAO genreDAO = GenreDAO();

  

  void toggleGenreList(GenreModel genre) {
    if (_listChooseGenre.contains(genre)) {
      _listChooseGenre.remove(genre);
    } else {
      _listChooseGenre.add(genre);
    }
  }

  void toggleArtistList(Artist artist) {
    print(_listArtist.value.length);
    if (_listChooseArtist.contains(artist)) {
      _listChooseArtist.remove(artist);
    } else {
      _listChooseArtist.add(artist);
    }
  }

  Future<void> fetchGenre() async {
    try {
      _isLoading.value = true;
      _listGenre.value = (await genreDAO.getGenres())!;
      _listArtist.value = (await genreDAO.getArtists())!;
    } catch (e) {
      // Handle any errors that occurred
      print(e);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> createRecommendPlayList() async {
    _isLoading.value = true;
    await genreDAO.addAccountGenre(_listChooseGenre);
    // await genreDAO.addAccountArtist(_listChooseArtist);
    await genreDAO.updateAccount();
    _isLoading.value = false;
  }
}
