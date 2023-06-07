import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/models/song_model.dart';
import 'package:swipetune/screens/playlist_playing_detail.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/playlist_playing/music_player.dart';
import 'package:swipetune/widgets/playlist_playing/playlist_playing_app_bar.dart';
import 'package:swipetune/widgets/playlist_playing/playlist_playing_header.dart';
import 'package:swipetune/widgets/playlist_playing/playlist_playing_song.dart';

class PlayListPlayingScreen extends StatelessWidget {
  const PlayListPlayingScreen({Key? key, required this.song}) : super(key: key);

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PlayListPlayingAppBar(context),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("${song.songImgUrl}"),
                fit: BoxFit.cover),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromRGBO(0, 0, 0, 0.5),
                const Color.fromRGBO(0, 0, 0, 0.5),
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                padding: sPadding(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.4896, 1],
                    colors: [
                      Color.fromARGB(255, 18, 149, 154),
                      Color.fromARGB(79, 32, 2, 2),
                      Color.fromARGB(255, 70, 18, 23),
                    ],
                  ),
                ),
              ),

               DefaultTabController(
                length: 2,
                child: Positioned.fill(
                    top: kToolbarHeight + sPadding().top, // Adjust the top position as needed
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.white,
                          labelStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900
                          ),
                          unselectedLabelStyle: TextStyle(

                            fontSize: 10
                          ),
                          unselectedLabelColor: Colors.white.withOpacity(0.5),
                          padding: EdgeInsets.only(left: 140, right: 140),

                          tabs: [
                            Tab(
                              icon: Icon(Icons.minimize),
                              // text: '__',

                            ),
                            Tab(
                              icon: Icon(Icons.minimize),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                               height: MediaQuery.of(context).size.height - kToolbarHeight - 50,
                              child: TabBarView(
                                children: [
                                  PlayListPlayingSong(song: song,), // First tab content
                                  PlayListPlayingDetail(song: song), // Second tab content
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
