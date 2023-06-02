import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:swipetune/screens/home_page.dart';
import 'package:swipetune/screens/my_library.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/screens/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key, this.initPage}) : super(key: key);

  final int? initPage;

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: initPage ?? 0);

    List<Widget> _buildScreens() {
      return [HomeScreen(), MyLibrary(), ProfileScreen()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_filled),
            activeColorPrimary: Colors.white,
            activeColorSecondary: Color(0xff31C9CE),
            inactiveColorPrimary: Colors.white,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.library_music),
            activeColorPrimary: Colors.white,
            activeColorSecondary: Color(0xff31C9CE),
            inactiveColorPrimary: Colors.white,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            activeColorPrimary: Colors.white,
            activeColorSecondary: Color(0xff31C9CE),
            inactiveColorPrimary: Colors.white,
          ),
        ];

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      confineInSafeArea: true,

      backgroundColor: Color(0xffFF7D87), // Default is Colors.white.
      handleAndroidBackButtonPress:
          true, // Default is true. This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            offset: Offset(0, -3),
          ),
        ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30.0),
        //   topRight: Radius.circular(30.0),
        // ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
      navBarHeight: 80,
    );
  }
}
