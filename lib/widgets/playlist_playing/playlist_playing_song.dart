import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/widgets/playlist_playing/music_player.dart';

class PlayListPlayingSong extends StatelessWidget {
  const PlayListPlayingSong({Key? key, required this.song}) : super(key: key);

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PlaylistPlayingHeader(),
        SizedBox(
          height: 100,
        ),
        Image.network("${song.songImgUrl}"),
        SizedBox(
          height: 32,
        ),
        Expanded(
          child: Text(
            "${song.songTitle}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          "${song.artist!.name}",
          style: TextStyle(color: Color(0xffB8BEC1)),
        ),
        MusicPlayer(song: song),
        SingleChildScrollView(
          child: Text(""),
        )
      ],
    );
  }
}
