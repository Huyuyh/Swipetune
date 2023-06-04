import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MusicPlayerController extends GetxController {
  final RxBool isPlaying = false.obs;
  final RxBool isLooping = false.obs;
  final RxBool isShuffling = false.obs;
  final Rx<Duration> bufferedPosition = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();
    // initSpotifySdk();
  }

  // Future<void> initSpotifySdk() async {
  //   try {
  //     final loggedIn = await SpotifyAuth.isLoggedIn;
  //     if (!loggedIn) {
  //       await SpotifyAuth.authenticate(
  //         clientId: 'YOUR_CLIENT_ID',
  //         redirectUrl: 'YOUR_REDIRECT_URL',
  //         scope: 'YOUR_SCOPES',
  //       );
  //     }
  //     await SpotifySdk.connectToSpotifyRemote();
  //     await SpotifySdk.subscribePlayerState();
  //     SpotifySdk.playerStateStream.listen((PlayerState playerState) {
  //       // Update the state of the music player
  //       isPlaying.value = playerState.isPaused;
  //       bufferedPosition.value = Duration(milliseconds: playerState.positionMs);
  //     });
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  Future<void> getAccessToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
        clientId: dotenv.env['CLIENT_ID'].toString(),
        redirectUrl: dotenv.env['REDIRECT_URL'].toString(),
        scope: 'app-remote-control, '
            'user-modify-playback-state, '
            'playlist-read-private, '
            'playlist-modify-public,user-read-currently-playing',
      );
      print('Got a token: $authenticationToken');
    } on PlatformException catch (e) {
      print('${e.code}: ${e.message}');
    } on MissingPluginException {
      print('not implemented');
    }
  }


  Future<void> play() async {
    try {
      await SpotifySdk.resume();
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> next() async {
    try {
      await SpotifySdk.skipNext();
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> previous() async {
    try {
      await SpotifySdk.skipPrevious();
    } catch (e) {
      print("Error: $e");
    }
  }

  void toggleLoop() {
    isLooping.value = !isLooping.value;
    // Handle loop logic
  }

  void toggleShuffle() {
    isShuffling.value = !isShuffling.value;
    // Handle shuffle logic
  }

  @override
  void dispose() {
    SpotifySdk.disconnect();
    super.dispose();
  }
}
