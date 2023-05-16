import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/select_genre/list_genre.dart';

class SelectGenreScreen extends StatefulWidget {
  const SelectGenreScreen({super.key});

  @override
  State<SelectGenreScreen> createState() => _SelectGenreScreenState();
}

class _SelectGenreScreenState extends State<SelectGenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: sPadding(),
          child: Column(
            children: [
              Container(
                height: 600,
                child: Column(
                  children: [
                    Container(
                      height: 50,

                      child: Text(
                        'Please choose at least 1 genre',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 32),
                    ListGenre(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              Center(
                  child: SolidButtonSmall(
                label: 'Next',
                color: Colors.pink,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
