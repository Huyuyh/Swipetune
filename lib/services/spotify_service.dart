import 'package:flutter/services.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/share_pref.dart';

Future<void> disconnectSpotify() async {
  try {
    var result = await SpotifySdk.disconnect();
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> connectToSpotifyRemote(String redirectUrl) async {
  try {
    var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: spotifyClientId,
        redirectUrl: redirectUrl,);
  } on PlatformException catch (e) {
    throw e;
  } on MissingPluginException {}
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

Future<void> playMusic(String id) async {
  try {
    final playerState = await SpotifySdk.getPlayerState();
  

    if (playerState != null && playerState.track != null && playerState.track!.uri == 'spotify:track:$id') {
      // If the current track is already playing, do nothing
      return;
    }
    await SpotifySdk.play(spotifyUri: 'spotify:track:$id');
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {
    throw "not implement";
  }
}

Future<void> pause() async {
  try {
    await SpotifySdk.pause();
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> addQueue(String id) async {
  try {
    await SpotifySdk.queue(spotifyUri: 'spotify:track:$id');
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<PlayerState?> getPlayerState() async {
  try {
    return await SpotifySdk.getPlayerState();
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> setRepeatMode() async {
  try {
    await SpotifySdk.setRepeatMode(
      repeatMode: RepeatMode.track,
    );
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> seekTo() async {
  try {
    await SpotifySdk.seekTo(positionedMilliseconds: 20000);
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> seekToRelative() async {
  try {
    await SpotifySdk.seekToRelativePosition(relativeMilliseconds: 20000);
  } on PlatformException catch (e) {
    print(e);
  } on MissingPluginException {}
}

Future<void> setShuffle(bool shuffle) async {
    try {
      await SpotifySdk.setShuffle(
        shuffle: shuffle,
      );
    } on PlatformException catch (e) {
      print(e);
    } on MissingPluginException {
    }
  }

