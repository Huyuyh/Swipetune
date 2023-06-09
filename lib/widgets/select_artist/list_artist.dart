import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/widgets/select_artist/artist.dart';

class ListArtist extends StatelessWidget {
  ListArtist({super.key});

  final GenreController _genreController = Get.find<GenreController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap( 
        spacing: 12,
        runSpacing: 50,
        children: [
          ..._genreController.listArtist.map((e) => ArtistAv(artist: e,)).toList()
        ],
      ),
    );
  }
}