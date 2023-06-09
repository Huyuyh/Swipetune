import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/select_artist/list_artist.dart';
import 'package:swipetune/widgets/select_genre/list_genre.dart';

class SelectArtistScreen extends StatelessWidget {
  const SelectArtistScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            Get.back();
          },
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
                        'Please choose at least 1 artist',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 32),
                    Expanded(child: SingleChildScrollView(child: ListArtist())),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              Center(
                  child: SolidButtonSmall(
                label: 'Finish',
                color: Colors.pink,
                onTap: () {
                  Get.find<GenreController>().createRecommendPlayList();
                  // Get.toNamed(Routes.getSelectArtist());
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
