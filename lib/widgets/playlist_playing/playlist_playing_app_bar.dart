import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget PlayListPlayingAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Container(
        child: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28,),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      "Playlist",
      style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 42),
        child: GestureDetector(
          onTap: () {},
          child: Icon(Icons.ios_share, color: Colors.white),
        ),
      )
    ],
  );
}