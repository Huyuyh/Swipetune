import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 200,
          child: Image.asset('assets/images/logo_fill.png'),
        ),
        Expanded(
          child: Container(
            child: Text(
              'Swipetune provides users with exciting experience in creating a favorite playlist from a diversity of random songs.Suitable for generations. Create viral. Conduct to access music more interesting for customers',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}
