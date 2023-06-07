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

  List<SwipeItem> swipeItems = <SwipeItem>[];

  List<SongModel> songModels = <SongModel>[].obs;

  MatchEngine? matchEngine;

  final SongDAO songDAO = SongDAO();

  // Spotify SDK related variables
  // late PlayerState _playerState;
  // StreamSubscription<PlayerState>? _playerStateSubscription;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    _isLoading.value = true;
    try {
      songModels = (await songDAO.getListSongRecommend())!;

      if (songModels != null) {
        for (int i = 0; i < songModels.length; i++) {
          swipeItems.add(
            SwipeItem(
              content: songModels[i],
              likeAction: () {
                Get.snackbar(
                  "Liked",
                  songModels[i].songTitle.toString(),
                  duration: Duration(milliseconds: 500),
                );
              },
              nopeAction: () {
                Get.snackbar(
                  "Nope",
                  songModels[i].songTitle.toString(),
                  duration: Duration(milliseconds: 500),
                );
              },
              superlikeAction: () {
                Get.snackbar(
                  "Superliked",
                  songModels[i].songTitle.toString(),
                  duration: Duration(milliseconds: 500),
                );
              },
              onSlideUpdate: (SlideRegion? region) async {
                print("Region $region");
              },
            ),
          );
        }

        matchEngine = await MatchEngine(swipeItems: swipeItems);
      }
    } catch (error) {
      // Handle the error gracefully
      print("Error: $error");
      Get.snackbar(
        "Error",
        "Failed to fetch song recommendations",
        duration: Duration(milliseconds: 1500),
      );
    } finally {
      SpotifySdk.subscribeConnectionStatus();
      SpotifySdk.subscribePlayerState();
      SpotifySdk.subscribePlayerContext();
      _isLoading.value = false;
    }

    super.onInit();
  }

  @override
  void onClose() {
    // Cancel the player state subscription and disconnect from Spotify SDK
    // _playerStateSubscription?.cancel();
    SpotifySdk.disconnect();

    super.onClose();
  }

  void makeApiCall(String url) async {
    try {
      final response = await Dio().get(url);

      // Process the response data as needed
      print(response.data);
    } catch (error) {
      // Handle any errors
      print('Error: $error');
    }
  }

  // Helper method to play a song using the Spotify SDK
  Future<void> playSong(String songUri) async {
    // SongModel currentSong = matchEngine?.currentItem?.content;
    // final player = AudioPlayer(); // Create a player
    // final duration = await player.setUrl(// Load a URL
    //     'https://www.nhaccuatui.com/mh/normal/OtjjsDyfZBEY');
    // await player.setVolume(1);
    // await player.play();

    // final String url = 'https://accounts.spotify.com/authorize?client_id=64a2a8a63cb7433a8f8e5bc11f62e189&response_type=code&redirect_uri=http://18.141.188.211:7049/api/SpotifyAccount/callback&scope=playlist-modify-public user-read-private user-read-email playlist-read-collaborative playlist-read-private playlist-modify-private';

    // makeApiCall(url);

    SongModel currentSong = matchEngine?.currentItem?.content;
    await SpotifySdk.play(
        spotifyUri: 'spotify:track:${currentSong.songId.toString()}}');

    // SpotifyService.connectToSpotifyRemote();

    // try {
    //   SongModel currentSong = matchEngine?.currentItem?.content;
    //   // await SpotifySdk.play(spotifyUri: 'spotify:track:${currentSong.songId}');
    //   SpotifySdk.play(spotifyUri: 'spotify:track:58kNJana4w5BIjlZE2wq5m');
    // } on PlatformException catch (e) {
    //   print(e);
    // } on MissingPluginException {
    //   print("not implement");
    // }

    // final authenticationToken = "BQBWlf9cYFheIuNp6UDrLeuVvgeqg0eZokSXjfePgrw2ZjyGwlK-_-E8iw4BUpxiLsZiLi987nVZPwYNk9g3EAKQmckVx3Bu2iWqq3V035nxNmZwI7fHdtonSNIK6uGI2q3nfZ3Een3KzYSBMTmQU4vZoLkTbpAdQhntnKec1dWNF_3BF_0K147LS3vyKC1cSut_F4kx76Q81rkLGVqcry-6keYDAH0XhGIlU2CT1xTlNWlZ3fu0M3Sihxnl6YyXyliIhOQXqGUfTkRB5Iml-4ElABWbIeqyMQ&oq=BQBWlf9cYFheIuNp6UDrLeuVvgeqg0eZokSXjfePgrw2ZjyGwlK-_-E8iw4BUpxiLsZiLi987nVZPwYNk9g3EAKQmckVx3Bu2iWqq3V035nxNmZwI7fHdtonSNIK6uGI2q3nfZ3Een3KzYSBMTmQU4vZoLkTbpAdQhntnKec1dWNF_3BF_0K147LS3vyKC1cSut_F4kx76Q81rkLGVqcry-6keYDAH0XhGIlU2CT1xTlNWlZ3fu0M3Sihxnl6YyXyliIhOQXqGUfTkRB5Iml-4ElABWbIeqyMQ&aqs=chrome..69i57.745j0j7&sourceid=chrome&ie=UTF-8";

    // if (authenticationToken != null) {
    //   final loggedIn = await SpotifySdk.connectToSpotifyRemote(
    //     clientId: 'b00f56db34f1432d869e84313a8325e9',
    //     redirectUrl: 'http://18.141.188.211:7049/api/SpotifyAccount/callback',
    //     accessToken: authenticationToken,
    //   );

    //   if (loggedIn) {
    //     SongModel currentSong = matchEngine?.currentItem?.content;
    //     await SpotifySdk.play(spotifyUri: currentSong.songId.toString());
    //   } else {
    //     Get.snackbar(
    //       'Error',
    //       'Failed to connect to Spotify',
    //       duration: Duration(seconds: 2),
    //     );
    //   }
    // } else {
    //   Get.snackbar(
    //     'Error',
    //     'Failed to authenticate with Spotify',
    //     duration: Duration(seconds: 2),
    //   );
    // }
  }

  // Other existing methods...

  void nope() {
    matchEngine?.currentItem?.nope();
  }

  void superLike() {
    SongModel currentSong = matchEngine?.currentItem?.content;
    matchEngine?.currentItem?.superLike();
  }

  void like() {
    SongModel currentSong = matchEngine?.currentItem?.content;
    Get.bottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        BottomSheetAddToPlayList(songId: currentSong.songId));
    // matchEngine?.currentItem?.like();
  }

  void addSuccess() {
    matchEngine?.currentItem?.like();
  }
}
