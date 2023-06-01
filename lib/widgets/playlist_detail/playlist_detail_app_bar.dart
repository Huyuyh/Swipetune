import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget PlayListDetailAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Container(
        child: Icon(Icons.arrow_back),
      ),
      onPressed: () {
        Get.back();
      },
    ),
    centerTitle: true,
    title: Text(
      "Playlist",
      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 42),
        child: GestureDetector(
          onTap: () {},
          child: Icon(Icons.ios_share),
        ),
      )
    ],
  );
}
