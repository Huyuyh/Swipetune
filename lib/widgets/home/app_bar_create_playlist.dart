import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';

PreferredSizeWidget AddToPlayListAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    elevation: 0,
    leading: IconButton(
      icon: Container(
        child: Icon(
          Icons.cancel,
          color: Colors.black,
          size: 28,
        ),
      ),
      onPressed: () {
        Get.find<AddPlayListController>().setEmptyList();
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      "Add to playlist",
      style: GoogleFonts.montserrat(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
