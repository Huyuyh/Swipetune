import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class OurVision extends StatelessWidget {
  const OurVision({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
          child: Container(
            child: Text(
              'Our vision is create a new market and change the way people access the music market.',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          width: 210,
          height: 231,
          child: Image.asset('assets/images/our_vision_image.png'))
        ],
      ),
    );
  }
}