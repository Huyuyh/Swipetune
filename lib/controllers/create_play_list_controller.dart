

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/dao/play_list_dao.dart';

class CreatePlayListController extends GetxController {

  final _isLoading = false.obs;


  bool get isLoading => _isLoading.value;


  PlayListDA0 playListDAO = PlayListDA0();


  void createPlayList(String name) async {
    try {
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