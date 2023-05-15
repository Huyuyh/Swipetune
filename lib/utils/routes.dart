import 'package:get/get.dart';
import 'package:swipetune/main.dart';
import 'package:swipetune/screens/login_page.dart';

class Routes {
  static const String _home = "/";

  static String getHomeRoute() => _home;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => LoginScreen())
    
  ];
}
