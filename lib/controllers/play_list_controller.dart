import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/dao/play_list_dao.dart';
import 'package:swipetune/models/play_list_model.dart';

class PlayListController extends GetxController {
  final dao = PlayListDA0();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _playLists = <PlayListModel>[].obs;
  List<PlayListModel> get playLists => _playLists.toList();

  Future<void> fetchPlayLists() async {
    try {
      _isLoading.value = true;
      final playLists = await dao.getPlayLists();
      if (playLists != null) {
        _playLists.assignAll(playLists);
      } else {
        // Handle the case when playLists is null
      }
    } catch (e) {
      // Handle any errors that occurred
      print(e);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> addPlayList(String? songId, List<String>? playListIds) async {
  try {
    _isLoading.value = true;
    bool isAddSuccess = await dao.addMusicToPlayList(songId!, playListIds!);
    if (isAddSuccess) {
      // Show success message using Get.snackbar
     await fetchPlayLists();
     Get.find<AddPlayListController>().setEmptyList();
     Get.snackbar(
        'Success',
        'Playlist added successfully.',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Show error dialog using Get.dialog
      Get.dialog(
        AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add playlist.'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
    return false;
  } catch (e) {
    print(e);
  } finally {
    _isLoading.value = false;
    return true;
  }
}

}
