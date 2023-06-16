import 'package:flutter/services.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/share_pref.dart';

Future<void> connectToSpotifyRemote(String redirectUrl) async {
  try {
    var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: spotifyClientId,
        redirectUrl: redirectUrl);
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {

  }
}

Future<String> getSpotifyAccessToken(String redirectUrl) async {
  try {
    var authenticationToken = await SpotifySdk.getAccessToken(
        clientId: spotifyClientId,
        redirectUrl: redirectUrl,
        scope: 'app-remote-control, '
            'user-modify-playback-state, '
            'playlist-read-private, '
            'playlist-modify-public,user-read-currently-playing');
    return authenticationToken;
  } on PlatformException catch (e) {
    return Future.error('$e.code: $e.message');
  } on MissingPluginException {
    return Future.error('not implemented');
  }
}


Future<void> playMusic() async {
    try {
      await SpotifySdk.play(spotifyUri: 'spotify:track:0nJW01T7XtvILxQgC5J7Wh');
    } on PlatformException catch (e) {
      print(e);
    } on MissingPluginException {
      
    }
  }

  Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } on PlatformException catch (e) {
      print(e);
    } on MissingPluginException {
    }
  }