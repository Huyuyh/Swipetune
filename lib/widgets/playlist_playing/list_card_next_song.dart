import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/playlist_playing/card_next_song.dart';

class ListCardNextSong extends StatelessWidget {
  const ListCardNextSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardNextSong(),
        CardNextSong(),
        CardNextSong(),
        CardNextSong(),
        CardNextSong(),
        
      ],
    );
  }
}