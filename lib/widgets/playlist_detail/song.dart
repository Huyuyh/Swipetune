import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/screens/playlist_playing.dart';
import 'package:swipetune/utils/routes.dart';

class Song extends StatelessWidget {
  Song({Key? key, required this.song}) : super(key: key);

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(
            isScrollControlled: true,
                                  // enableDrag: false,
            PlayListPlayingScreen(song: song,)
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Color.fromRGBO(236, 236, 236, 0.7),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 9),
                        child: Container(
                          height: 69,
                          width: 69,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network("${song.songImgUrl}")),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${song.songTitle}",
                                     overflow: TextOverflow.ellipsis,
                                     maxLines: 2,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${song.artist!.name}",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Icon(Icons.more_vert),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}