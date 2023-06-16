import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swipetune/services/spotify_service.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyLoginScreen extends StatelessWidget {
  Future<void> _loginWithSpotify(BuildContext context) async {
    try {
// Construct the Spotify authorization URL
      final url = Uri.https('accounts.spotify.com', '/authorize', {
        'response_type': 'code',
        'client_id': spotifyClientId,
        'redirect_uri': '$callbackUrlScheme:/',
        'scope': 'playlist-modify-public',
      });

      String accessToken = await getSpotifyAccessToken('$callbackUrlScheme:/');

      await connectToSpotifyRemote('$callbackUrlScheme:/');

// Present the authentication dialog to the user
      // final result = await FlutterWebAuth.authenticate(
      //     url: url.toString(), callbackUrlScheme: 'swipetune');

      // print(await getSpotifyAccessToken(result));

// Extract the authorization code from the resulting URL
//       final code = Uri.parse(result).queryParameters['code'];

// // Use this code to get an access token from Spotify
//       final response = await http
//           .post(Uri.parse('https://accounts.spotify.com/api/token'), body: {
//         'grant_type': 'authorization_code',
//         'code': code,
//         'redirect_uri': '$callbackUrlScheme:/',
//         'client_id': spotifyClientId,
//         'client_secret': clientSecret,
//         // Add any other required parameters
//       });

// // Get the access token from the response
//       final accessToken = jsonDecode(response.body)['access_token'] as String;
//       print('Access token: $accessToken');
    } catch (e) {
      // Handle any errors that occur during the authentication process
      print('Authentication Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _loginWithSpotify(context);
              },
              child: Text('Login with Spotify'),
            ),
            ElevatedButton(
              onPressed: () {
                playMusic();
              },
              child: Text('Play Music'),
            ),
            ElevatedButton(
              onPressed: () {
                pause();
              },
              child: Text('Pause Music'),
            ),
          ],
        ),
      ),
    );
  }
}
