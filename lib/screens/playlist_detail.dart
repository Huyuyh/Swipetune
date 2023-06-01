import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/playlist_detail/list_song.dart';
import 'package:swipetune/widgets/playlist_detail/playlist_detail_app_bar.dart';

class PlayListDetailScreen extends StatelessWidget {
  const PlayListDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlayListDetailAppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 110.0, // Set the desired height
                  width: 110.0, // Set the desired width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/playlist.png"),
                      fit: BoxFit.cover, // Set the desired fit mode
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Playlist 1",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                Text("47 songs . 3h for all", style: TextStyle(fontSize: 12)),
                SizedBox(
                  height: 10,
                ),
                SolidButtonSmall(label: "Randomly", color: Color(0xff31C9CE)),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(child: SingleChildScrollView(child: ListSong()))
        ],
      ),
    );
  }
}
