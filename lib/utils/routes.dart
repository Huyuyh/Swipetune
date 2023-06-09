import 'package:get/get.dart';
import 'package:swipetune/main.dart';
import 'package:swipetune/screens/about_us_page.dart';
import 'package:swipetune/screens/home_page.dart';
import 'package:swipetune/screens/login_page.dart';
import 'package:swipetune/screens/my_library.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/screens/profile_page.dart';
import 'package:swipetune/screens/select_app.dart';
import 'package:swipetune/screens/select_artist.dart';
import 'package:swipetune/screens/select_genre.dart';
import 'package:swipetune/screens/sign_in.dart';
import 'package:swipetune/screens/sign_up_page.dart';
import 'package:swipetune/screens/start_up.dart';
import 'package:swipetune/widgets/bottom_nav_bar/nav_bar.dart';

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
  static const String _root = "/Root";
  static const String _playListDetail = "/PlayListDetail";
  static const String _startUp = "/StartUp";
  static const String _selectArtist = "/SelectArtist";

  static String getStartUp() => _startUp;
  static String getHomeRoute() => _login;
  static String getSignInRoute() => _signIn;
  static String getHomePageRoute() => _home;
  static String getProfileRoute() => _profile;
  static String getLibraryRoute() => _library;
  static String getSignUpRoute() => _signUp;
  static String getRootRoute() => _root;
  static String getPlayListDetail() => _playListDetail;
  static String getAbout() => _aboutUs; 
  static String getSelectGenre() => _selectGenre;
  static String getSelectArtist() => _selectArtist;


  

  static List<GetPage> routes = [
    GetPage(name: _startUp, page: () => StartUp()),
    GetPage(name: _root, page: () => RootScreen()),
    GetPage(name: _home, page: () => HomeScreen()),
    GetPage(name: _login, page: () => LoginScreen()),
    GetPage(name: _aboutUs, page: () => AboutUsScreen()),
    GetPage(name: _selectGenre, page: () => SelectGenreScreen()),
    GetPage(name: _selectApp, page: () => SelectApp()),
    GetPage(name: _profile, page: () => ProfileScreen()),
    GetPage(name: _library, page: () => MyLibrary()),
    GetPage(name: _signIn, page: () => SignInScreen()),
    GetPage(name: _signUp, page: () => SignUpScreen()),
    GetPage(name: _playListDetail, page: () => PlayListDetailScreen()),
    GetPage(name: _selectArtist, page: () => SelectArtistScreen()),


  ];
}