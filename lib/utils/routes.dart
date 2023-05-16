import 'package:get/get.dart';
import 'package:swipetune/main.dart';
import 'package:swipetune/screens/about_us_page.dart';
import 'package:swipetune/screens/login_page.dart';
import 'package:swipetune/screens/select_app.dart';
import 'package:swipetune/screens/select_genre.dart';

class Routes {
  static const String _login = "/";
  static const String _aboutUs = "/AboutUs";
  static const String _selectGenre = "/SelectGenre";
  static const String _selectApp = "/SelectApp";

  static String getHomeRoute() => _selectApp;

  static List<GetPage> routes = [
    GetPage(name: _login, page: () => LoginScreen()),
    GetPage(name: _aboutUs, page: () => AboutUsScreen()),
    GetPage(name: _selectGenre, page: () => SelectGenreScreen()),
    GetPage(name: _selectApp, page: () => SelectApp())
  ];
}