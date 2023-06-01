import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:swipetune/screens/home_page.dart';
import 'package:swipetune/screens/my_library.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/screens/profile_page.dart';
import 'package:get/get.dart';

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
        () => Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex.value,
              children: _screens,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              backgroundColor: Color(0xfff5f5f5),
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
          ),
        ],
      ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Color(0xfff5f5f5),
      //   buttonBackgroundColor: Color(0xff31C9CE),
      //   color: Color(0xffFF7D87),
      //   index: _currentIndex.value,
      //   items: [
      //     Icon(
      //       Icons.home_filled,
      //       color: Colors.white,
      //     ),
      //     Icon(Icons.library_music, color: Colors.white),
      //     Icon(Icons.person, color: Colors.white),
      //   ],
      //   onTap: (index) {
      //     _currentIndex.value = index;
      //   },
      // ),
    );
  }
}
