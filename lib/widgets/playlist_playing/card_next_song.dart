import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNextSong extends StatelessWidget {
  const CardNextSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Color.fromRGBO(128, 128, 128, 0.5),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 9),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/song_1_image.png")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Song 1",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "singer 1",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  child: Icon(Icons.more_vert),
                )
              ],
            ),
          ),
        );
  }
}