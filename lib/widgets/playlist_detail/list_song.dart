import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/playlist_detail/song.dart';

class ListSong extends StatelessWidget {
  const ListSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding(),
      child: Column(
        children: [
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
        ],
      ),
    );
  }
}