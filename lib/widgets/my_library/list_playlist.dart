import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/my_library/playlist.dart';

class ListPlayList extends StatelessWidget {
  const ListPlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: sPadding(),
      child: Column(
        children: [
          PlayList(),
          PlayList(),
          PlayList(),
          PlayList(),
          PlayList(),
          PlayList(),
        ],
      ),
    );
  }
}