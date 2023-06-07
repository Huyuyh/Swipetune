import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MusicPlayerBottomNavBar extends StatelessWidget {
  const MusicPlayerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffFF7D87),
            border: Border(
                top: BorderSide(color: Colors.grey), bottom: BorderSide())),
        // height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: ClipRRect(
                      // borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/playlist.png")),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Song 1 - ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Singer 1",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ));
  }
}
