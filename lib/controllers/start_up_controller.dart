import 'package:get/get.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/dao/login_dao.dart';
import 'package:swipetune/models/play_list_model.dart';
import 'package:swipetune/services/spotify_service.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/utils/share_pref.dart';

class StartUpController extends GetxController {
  final _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  StartUpController() {
    pause();
    handleStartUpLogic();
  }

  Future handleStartUpLogic() async {
    LoginDAO _loginDAO = LoginDAO();

    bool? isFirstOnBoard = await getIsFirstOnboard();
    bool hasLoggedInUser = await _loginDAO.isUserLoggedIn();

    await Future.delayed(Duration(seconds: 1), () {
      _isLoading.value = false;
    });

    // if (isFirstOnBoard) {
    //   _isLoading.value = true;
    //   Get.toNamed(Routes.getAbout());
    // }
    // else
     if (hasLoggedInUser) {
      _isLoading.value = true;
      connectToSpotifyRemote('$callbackUrlScheme:/');

      // Get.put(AddPlayListController());
      Get.offAndToNamed(Routes.getRootRoute());
    } else {
      _isLoading.value = true;
      Get.offAndToNamed(Routes.getHomeRoute());
      // Get.offAll(HistoryPage());
    }
  }
}
