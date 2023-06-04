import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class PlaylistPlayingHeader extends StatelessWidget {
  const PlaylistPlayingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.keyboard_arrow_down_outlined,
          size: 32,
          color: Colors.white,
          ),
          Text("Playlist 1",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          ),
          Icon(Icons.ios_share,
          color: Colors.white,
          ),
        ],
      ),
    );
  }
}