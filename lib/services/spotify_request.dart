import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyService {
  static const String baseSpotifyUrl = 'https://accounts.spotify.com/authorize';

  static Dio dio = Dio(BaseOptions(baseUrl: baseSpotifyUrl));

  static Map<String, dynamic> param = {
    'client_id': '64a2a8a63cb7433a8f8e5bc11f62e189',
    'response_type': 'code',
    'redirect_uri': 'http://18.141.188.211:7049/api/SpotifyAccount/callback',
    'scope':
        'playlist-modify-public user-read-private user-read-email playlist-read-collaborative playlist-read-private playlist-modify-private',
  };

  String generateQueryParam(Map<String, dynamic> params) {
    return params.entries.map((entry) {
      final key = Uri.encodeComponent(entry.key);
      final value = Uri.encodeComponent(entry.value.toString());
      return '$key=$value';
    }).join('&');
  }

  static Future<Response> get() async {
    try {
      final response = await dio.get('', queryParameters: param);
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: '64a2a8a63cb7433a8f8e5bc11f62e189',
          redirectUrl: 'http://18.141.188.211:7049/api/SpotifyAccount/callback');
    } on PlatformException catch (e) {

    } on MissingPluginException {

    }
  }

  static Future<String> getAccessTokenSpotify() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
          clientId: '64a2a8a63cb7433a8f8e5bc11f62e189',
          redirectUrl: 'http://18.141.188.211:7049/api/SpotifyAccount/callback',
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

  


  static void getAccessToken() async {
    final dio = Dio();
    final url = 'https://accounts.spotify.com/api/token';
    final clientId = '64a2a8a63cb7433a8f8e5bc11f62e189';
    final clientSecret =
        'YOUR_CLIENT_SECRET'; // Replace with your actual client secret
    final redirectUri = 'http://18.141.188.211:7049/api/SpotifyAccount/login';

    try {
      final response = await dio.post(
        url,
        data: {
          'grant_type': 'authorization_code',
          'code': ' AQDlWVZSsMZoAM5a5DpNcvZJ8gBaYqeWVAbcgz4JtifGQMyHMq0Z_t0l3m1NRP5uJEWYrNCLzJTwG8-jEChdi6bNTgjE3xBS4YDFYgONhHPktotrkTTNHvx7shuoLdpemmvJAUYezjX2f4cBnCUg-6vxAw2BXqBE4YPv8wM9lwNtYsNPzkv4b-LmWcA3cgoLj2keSJdivbSOMqKSrhQrvYJBnjIspSg0dhWvB2Iu-sdaUIF9OkBr9t-isweLfTMsH6iMOQDffBdFO9dCH1S6jM5AYspGSfZq-QlWvZkJY9gbzMK5FMM8lUZB3NLQcw2VHGy_FErpukBjuwo3gQxo6eQ3Lt_xXaQRMeKTd8DOf0gqX6gGoNgxSzZXcNoUcGbm',
          'client_id': clientId,
          // 'client_secret': clientSecret,
          'redirect_uri': redirectUri,
        },
      );

      // Process the response and extract the access token
      final accessToken = response.data['access_token'];

      // Use the access token for further operations
      // ...
    } catch (e) {
      print('Error: $e');
    }
  }
}
