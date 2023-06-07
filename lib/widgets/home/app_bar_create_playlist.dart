import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget AddToPlayListAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    elevation: 0,
    leading: IconButton(
      icon: Container(
        child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 28,),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      "Add to playlist",
      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}