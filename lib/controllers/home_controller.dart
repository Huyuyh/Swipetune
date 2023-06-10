import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipetune/dao/song_dao.dart';
import 'package:swipetune/models/content.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/services/spotify_request.dart';
import 'package:swipetune/utils/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:swipetune/widgets/bottom_sheet/bottom_sheet_create_playlist.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
  final _isLoading = false.obs;

  List<SongModel> songModels = <SongModel>[].obs;

  final _currentSong = SongModel().obs;

  final SongDAO songDAO = SongDAO();

  bool get isLoading => _isLoading.value;
  SongModel get currentSong => _currentSong.value;

  @override
  void onInit() {
    fetchSong();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // New Swipe card

  void setCurrentSong(SongModel song) {
    _currentSong.value = song;
  }

  void addToList() {
    Get.bottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        BottomSheetAddToPlayList(songId: _currentSong.value.songId));
  }

  void fetchNewSong() async {
    final newSongs = await songDAO.getListSongRecommend();
    if (newSongs != null) {
      songModels.addAll(newSongs);
    }
    _isLoading.value = true;

    _isLoading.value = false;
  }

  void fetchSong() async {
    _isLoading.value = true;
    try {
      songModels = (await songDAO.getListSongRecommend())!;
    } catch (error) {
      // Handle the error gracefully
      print("Error: $error");
      Get.snackbar(
        "Error",
        "Failed to fetch song recommendations",
        duration: Duration(milliseconds: 1500),
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
