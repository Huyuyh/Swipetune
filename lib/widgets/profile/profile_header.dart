import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/utils/share_pref.dart';
import 'package:swipetune/widgets/button/button_small.dart';
import 'package:swipetune/widgets/profile/avatar.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  final PlayListController playListController = Get.find<PlayListController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Avatar(),
        SizedBox(
          height: 10,
        ),
        Text(
          "Pham Ho Minh Huy",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff565656)),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SolidButtonSmall(
              label: "Edit", 
              color: Color(0xff7FEDF0),
              onTap: () async {
                bool test = Get.isRegistered<GenreController>();
                if(!test) {
                  await Get.put(GenreController());
                  await Get.find<GenreController>().fetchGenre();
                  await Get.find<GenreController>().fetchChoosedGenre();

                }
                Get.toNamed(Routes.getSelectGenre());
              },
              ),
            SolidButtonSmall(
              label: "Log out",
              color: Color(0xffFF7D87),
              onTap: () {
                removeALL();
                Get.offAllNamed(Routes.getHomeRoute());
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Column(
        //       children: [
        //         Text("${playListController.playLists.length}"),
        //         Text("Playlist"),
        //       ],
        //     ),
        //     Container(
        //       width: 1.0,
        //       color: Colors.black,
        //       height: 40.0, // Adjust the height of the line as needed
        //     ),
        //     Column(
        //       children: [
        //         Text("45"),
        //         Text("Follower"),
        //       ],
        //     ),
        //     Container(
        //       width: 1.0,
        //       color: Colors.black,
        //       height: 40.0, // Adjust the height of the line as needed
        //     ),
        //     Column(
        //       children: [
        //         Text("30"),
        //         Text("Following"),
        //       ],
        //     ),
        //   ],
        // )
      ],
    ));
  }
}
