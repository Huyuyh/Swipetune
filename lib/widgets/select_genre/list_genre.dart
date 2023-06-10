import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';

import 'genre.dart';

class ListGenre extends StatelessWidget {
  ListGenre({super.key});

  final GenreController _genreController = Get.find<GenreController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap( 
        spacing: 12,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        children: [
          ..._genreController.listGenre.map((e) => Genre(genre: e,)).toList()
        ],
      ),
    );
  }
}