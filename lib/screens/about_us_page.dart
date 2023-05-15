// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/about_us/about_us_logo.dart';
import 'package:swipetune/widgets/about_us/our_vision.dart';
import 'package:swipetune/widgets/button/button_small.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: sPadding(),
          child: Column(
            children: [
              
              Container(
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Us",
                      style: GoogleFonts.montserrat(
                          color: Color(0xffFF7D87),
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    AboutUs(),
                    SizedBox(height: 20),
                    Text(
                      "Our vision",
                      style: GoogleFonts.montserrat(
                          color: Color(0xffFF7D87),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    OurVision(),
                  ],
                ),
              ),
                  Center(child: SolidButtonSmall(label: 'Next', color: Colors.pink,))
          
            ],
          ),
        ),
      ),
    );
  }
}
