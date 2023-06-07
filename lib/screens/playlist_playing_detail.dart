import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/playlist_playing/card_song_info.dart';
import 'package:swipetune/widgets/playlist_playing/list_card_next_song.dart';
import 'package:swipetune/widgets/playlist_playing/music_player.dart';

class PlayListPlayingDetail extends StatelessWidget {
  const PlayListPlayingDetail({Key? key, required this.song}) : super(key: key);

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SongCardInfo(song: song,),
          SizedBox(
            height: 14,
          ),
          Text(
            "Next Songs",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 14,
          ),
          Expanded(child: SingleChildScrollView(
            child: ListCardNextSong())),
          Expanded(child: MusicPlayer(song: song))
        ],
      ),
    );
  }
}
