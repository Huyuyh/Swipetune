import 'package:get/get.dart';
import 'package:swipetune/main.dart';
import 'package:swipetune/screens/about_us_page.dart';
import 'package:swipetune/screens/home_page.dart';
import 'package:swipetune/screens/login_page.dart';
import 'package:swipetune/screens/my_library.dart';
import 'package:swipetune/screens/profile_page.dart';
import 'package:swipetune/screens/select_app.dart';
import 'package:swipetune/screens/select_genre.dart';
import 'package:swipetune/screens/sign_in.dart';
import 'package:swipetune/screens/sign_up_page.dart';

class Routes {
  static const String _login = "/";
  static const String _aboutUs = "/AboutUs";
  static const String _selectGenre = "/SelectGenre";
  static const String _selectApp = "/SelectApp";
  static const String _profile = "/Profile";
  static const String _home = "/Home";
  static const String _library = "/Library";
  static const String _signIn = "/SignIn";
  static const String _signUp = "/SignUp";

  static String getHomeRoute() => _login;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => HomeScreen()),
    GetPage(name: _login, page: () => LoginScreen()),
    GetPage(name: _aboutUs, page: () => AboutUsScreen()),
    GetPage(name: _selectGenre, page: () => SelectGenreScreen()),
    GetPage(name: _selectApp, page: () => SelectApp()),
    GetPage(name: _profile, page: () => ProfileScreen()),
    GetPage(name: _library, page: () => MyLibrary()),
    GetPage(name: _signIn, page: () => SignInScreen()),
    GetPage(name: _signUp, page: () => SignUpScreen()),


  ];
}