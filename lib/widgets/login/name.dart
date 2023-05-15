import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SWIPETUNE',
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w700
          )
        ),
        Text(
          'Music fun swipe',
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          )
        )
      ],
    );
  }
}
