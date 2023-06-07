import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipetune/widgets/bottom_nav_bar/music_player_bottom_nav_bar.dart';
import 'package:swipetune/widgets/my_library/library_app_bar.dart';
import 'package:swipetune/widgets/my_library/list_playlist.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LibraryAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ListPlayList()),
                Center(
                  child: Image.asset("assets/images/logo_premium.png"),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MusicPlayerBottomNavBar()
    );
  }
}
