import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget LibraryAppBar() {
  return AppBar(
    
    leading: IconButton(
      icon: Container(
        child: Icon(Icons.arrow_back),
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Row(
      children: [
        Container(
            height: 50,
            width: 50,
            child: Image.asset("assets/images/avatar.png")),
        Container(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            "My Library",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 42),
        child: GestureDetector(
          onTap: (){},
          child: Icon(Icons.add),
        ),
      )
    ],
  );
}
