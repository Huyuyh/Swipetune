import 'package:get/get.dart';
import 'package:swipetune/main.dart';
import 'package:swipetune/screens/about_us_page.dart';
import 'package:swipetune/screens/login_page.dart';

class Routes {
  static const String _login = "/";
  static const String _aboutUs = "/AboutUs";

  static String getHomeRoute() => _aboutUs;

  static List<GetPage> routes = [
    GetPage(name: _login, page: () => LoginScreen()),
    GetPage(name: _aboutUs, page: () => AboutUsScreen())
  ];
}
