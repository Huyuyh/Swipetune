

import 'package:get/get.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/services/spotify_service.dart';

class LifeCycleController extends SuperController {
  // final _isPause = true.obs;

  // bool get isPause => _isPause.value;


  @override
  void onDetached() {
    pause();
  }

  @override
  void onInactive() {
    // _isPause.value = false;
    if(Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().setPause(true);
    }
    pause();
  }

  @override
  void onPaused() {
    // _isPause.value = false;
    if(Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().setPause(true);
    }
    pause();

  }

  @override
  void onResumed() {}
}