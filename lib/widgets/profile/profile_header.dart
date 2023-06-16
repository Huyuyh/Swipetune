import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/controllers/play_list_controller.dart';
import 'package:swipetune/controllers/spotify_controller.dart';
import 'package:swipetune/services/spotify_service.dart';
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
                if (!test) {
                  await Get.put(GenreController());
                  await Get.find<GenreController>().fetchGenre();
                  await Get.find<GenreController>().fetchChoosedGenre();
                }
                Get.toNamed(Routes.getSelectGenre());
              },
            ),
            SolidButtonSmall(
              label: "Upgrade",
              color: CupertinoColors.activeGreen,
              onTap: () {
                          Get.to(SpotifyLoginScreen());
                
                // Get.dialog(
                //   AlertDialog(
                //     title: Text('Update premium'),
                //     content: Container(
                //       width: 300,
                //       height: 300,
                //       child: Image.network("https://media.istockphoto.com/id/828088276/vector/qr-code-illustration.jpg?s=612x612&w=0&k=20&c=FnA7agr57XpFi081ZT5sEmxhLytMBlK4vzdQxt8A70M="),
                //     ),
                //     actions: [
                //       TextButton(
                //         onPressed: () {
                //           // Close the dialog
                //           Get.back();
                //         },
                //         child: Text('OK'),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SolidButtonSmall(
          label: "Log out",
          color: Color(0xffFF7D87),
          onTap: () {
            removeALL();
            pause();
            disconnectSpotify();
            Get.offAllNamed(Routes.getHomeRoute());
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
