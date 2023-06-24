import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:swipetune/screens/home_page.dart';
import 'package:swipetune/screens/my_library.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/screens/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:swipetune/services/spotify_service.dart';

class RootScreen extends StatelessWidget {
  final int? initPage;

  RootScreen({Key? key, this.initPage}) : super(key: key);

  final List<Widget> _screens = [
    HomeScreen(),
    MyLibrary(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _currentIndex = RxInt(initPage ?? 0);

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _currentIndex.value,
          children: _screens,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xff31C9CE),
        color: Color(0xffFF7D87),
        index: _currentIndex.value,
        items: [
          Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          Icon(Icons.library_music, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          _currentIndex.value = index;
        },
      ),
    );
  }
}
