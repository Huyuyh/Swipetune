import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/models/genre_model.dart';
import 'package:swipetune/models/song_model.dart';

class ArtistAv extends StatelessWidget {
  ArtistAv({Key? key, required this.artist}) : super(key: key);

  final GenreController _genreController = Get.find<GenreController>();

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _genreController.toggleArtistList(artist);
      },
      child: Container(
        child: Obx(() => Column(
          children: [
            if (!_genreController.listChooseArtist.contains(artist)) ...[
              Container(
                width: 100,
                height: 100,
                child: ClipOval(child: Image.network('${artist.artistImgUrl}', fit: BoxFit.cover,)),
              ),
            ] else ...[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xff31C9CE),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  color: CupertinoColors.white,
                  size: 40,
                ),
              ),
            ],
            Text("${artist.name}", 
            style: TextStyle(
              fontSize: 12,
            ),)
          ],
        ),)
      ),
    );
  }
}
