import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/widgets/bottom_sheet/bottom_sheet_create_new_playlist.dart';


PreferredSizeWidget LibraryAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Container(
        child: Icon(Icons.search),
      ),
      onPressed: () {},
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
          onTap: () {
            Get.bottomSheet(
                isScrollControlled: true, 
                BottomSheetCreatePlayList());
          },
          child: Icon(Icons.add),
        ),
      )
    ],
  );
}
