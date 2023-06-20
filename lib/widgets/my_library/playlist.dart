import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swipetune/controllers/add_play_list_controller.dart';
import 'package:swipetune/models/play_list_model.dart';
import 'package:swipetune/screens/playlist_detail.dart';
import 'package:swipetune/utils/routes.dart';

class PlayList extends StatefulWidget {
  PlayList(
      {Key? key, required this.playlist, this.onTap, this.songId, this.isAdd})
      : super(key: key);

  final PlayListModel playlist;
  final VoidCallback? onTap;
  final String? songId;
  final bool? isAdd;

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  final AddPlayListController _controller = Get.find<AddPlayListController>();

  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    if (widget.songId != null) {
      isAdded = widget.playlist.playlistSongs!
          .any((song) => song.songId == widget.songId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: widget.isAdd == null
            ? widget.onTap
            : () {
                setState(() {
                  if (!isAdded) {
                    isAdded = !isAdded;
                  }
                });
                _controller.togglePlayList(widget.playlist.playlistId);
              },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Color.fromRGBO(236, 236, 236, 0.7),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 9),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/playlist.png")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.playlist.name}",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${widget.playlist.playlistSongs!.length} songs",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  child: widget.isAdd == null
                      ? GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                // title: const Text('Dialog'),
                                content: GestureDetector(
                                  onTap: () {
                                    _controller.syncPlayListToSpotfiy(
                                        widget.playlist.playlistId.toString());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF7D87),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "Sync to spotify",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.more_vert))
                      : isAdded == true
                          ? Icon(
                              Icons.check_circle,
                              color: Color(0xff31C9CE),
                            )
                          : Icon(Icons.circle_outlined,
                              color: Color(0xff31C9CE)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
