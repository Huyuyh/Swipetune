import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/playlist_playing/music_player.dart';

class PlayListPlayingSong extends StatelessWidget {
  const PlayListPlayingSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PlaylistPlayingHeader(),
        SizedBox(
          height: 100,
        ),
        Image.asset("assets/images/song_image.png"),
        SizedBox(
          height: 32,
        ),
        Text(
          "Song 1",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          "Singer 1",
          style: TextStyle(color: Color(0xffB8BEC1)),
        ),
        MusicPlayer(),
        SingleChildScrollView(
          child: Text(""),
        )
      ],
    );
  }
}
