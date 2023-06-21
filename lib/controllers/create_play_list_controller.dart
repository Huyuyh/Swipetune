import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/home_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/dao/play_list_dao.dart';

class CreatePlayListController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  PlayListDA0 playListDAO = PlayListDA0();

  void createPlayList(String name) async {
    try {
      final playList = await Get.find<PlayListController>().playLists;
      final premium = await Get.find<HomeController>().premiumAccount;
      if (premium == "" && playList.length == 6) {
        Get.dialog(
          AlertDialog(
            title: Text('Premium'),
            content: Text(
                'You need to upgrage account to premium to more playlists'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        _isLoading.value = true;
        await playListDAO.createNewPlayList(name);
        await Get.find<PlayListController>().fetchPlayLists();
        Get.back();
        Get.snackbar(
          'Success',
          'Playlist create successfully.',
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xffFF7D87),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
      Get.dialog(
        AlertDialog(
          title: Text('Login Error'),
          content: Text('An error occurred during login: ${e}'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
