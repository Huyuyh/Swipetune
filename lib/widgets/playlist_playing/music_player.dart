import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/music_player_controller.dart';
import 'package:swipetune/models/song_model.dart';

class MusicPlayer extends GetView<MusicPlayerController> {
  const MusicPlayer({Key? key, required this.song}) : super(key: key);

  final SongModel song;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Slider(
            
            activeColor: Colors.white,
            value: 0.5, // Replace with current position value
            onChanged: (double value) {
              // TODO: Handle seeking to a specific position
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    // TODO: Handle shuffling logic
                  },
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      // TODO: Handle previous track logic
                    },
                  ),
                  SizedBox(width: 20,),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      // TODO: Handle play logic
                    },
                  ),
                  SizedBox(width: 20,),

                  // IconButton(
                  //   icon: Icon(Icons.pause),
                  //   onPressed: () {
                  //     // TODO: Handle pause logic
                  //   },
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      // TODO: Handle next track logic
                    },
                  ),
                  SizedBox(width: 20,),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: IconButton(
                  icon: Icon(
                    Icons.repeat,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    // TODO: Handle previous track logic
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
