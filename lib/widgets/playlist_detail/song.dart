import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/utils/routes.dart';

class Song extends StatelessWidget {
  const Song({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(Routes.getPlayListDetail());
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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 9),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/playlist.png")),
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
        ),
      ),
    );
  }
}