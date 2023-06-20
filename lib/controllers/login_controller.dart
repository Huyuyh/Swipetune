import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:swipetune/dao/login_dao.dart';
import 'package:swipetune/services/spotify_service.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:http/http.dart' as http;
import 'package:swipetune/utils/share_pref.dart';

class LoginController extends GetxController {
  final _isLoading = false.obs;
  final _isLoggedIn = false.obs;
  final _isRemember = false.obs;
  final _tmpAccounId = "".obs;
  final LoginDAO _loginDAO = LoginDAO();

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;
  bool get isRemember => _isRemember.value;
  String get tmpAccountId => _tmpAccounId.value;

  void checkRemember() {
    _isRemember.value = !_isRemember.value;
  }

  void setAccountId(String accountId){
    _tmpAccounId.value=accountId;
  }

  void login(String email, String password) async {
    try {
      _isLoading.value = true;

      String accessToken = await getSpotifyAccessToken('$callbackUrlScheme:/');
      await setAccessToken(accessToken);

      await _loginDAO.login(email, password, _isRemember.value);

      // Simulate successful login
      _isLoggedIn.value = true;
    } catch (e) {
      // Handle error
      _isLoggedIn.value = false;
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

  Future<void> _loginWithSpotify(BuildContext context) async {
    try {
      const spotifyClientId = '64a2a8a63cb7433a8f8e5bc11f62e189';
      const callbackUrlScheme =
          'swipetune'; // Replace with your custom URL scheme

// Construct the Spotify authorization URL
      final url = Uri.https('accounts.spotify.com', '/authorize', {
        'response_type': 'code',
        'client_id': spotifyClientId,
        'redirect_uri': '$callbackUrlScheme:/',
        'scope': 'playlist-modify-public',
      });

// Present the authentication dialog to the user
      final result = await FlutterWebAuth.authenticate(
          url: url.toString(), callbackUrlScheme: 'swipetune');

// Extract the authorization code from the resulting URL
      final code = Uri.parse(result).queryParameters['code'];

// Use this code to get an access token from Spotify
      final response = await http
          .post(Uri.parse('https://accounts.spotify.com/api/token'), body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': '$callbackUrlScheme:/',
        'client_id': spotifyClientId,
        'client_secret': 'b0a49f2eab454292bff2c5d5bb7613c3',
        // Add any other required parameters
      });

// Get the access token from the response
      final accessToken = jsonDecode(response.body)['access_token'] as String;
      print('Access token: $accessToken');
      setAccessToken(accessToken);
    } catch (e) {
      // Handle any errors that occur during the authentication process
      print('Authentication Error: $e');
    }
  }

}
