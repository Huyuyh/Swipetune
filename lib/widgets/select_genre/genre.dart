import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/models/genre_model.dart';

class Genre extends StatelessWidget {
  Genre({Key? key, required this.genre}) : super(key: key);

  final GenreController _genreController = Get.find<GenreController>();

  final GenreModel genre;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _genreController.toggleGenreList(genre);
      },
      child: Container(
        child: Obx(() => Column(
          children: [
            if (!_genreController.listChooseGenre.contains(genre)) ...[
              // Container(
              //   width: 100,
              //   height: 100,
              //   child: Image.asset('assets/images/tmp_genre_image.png', fit: BoxFit.cover,),
              // ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text("${genre.name}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16

                ),),
              ),
            ] else ...[    
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black,

                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text("${genre.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
              ),       
              // Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     color: Color(0xff31C9CE),
              //     borderRadius: BorderRadius.circular(50),
              //   ),
              //   alignment: Alignment.center,
              //   child: const Icon(
              //     Icons.check,
              //     color: CupertinoColors.white,
              //     size: 40,
              //   ),
              // ),
            ],
            // Text("${genre.name}",
            // style: TextStyle(
            //   fontSize: 12,
            // ),)
          ],
        ),)
      ),
    );
  }
}
