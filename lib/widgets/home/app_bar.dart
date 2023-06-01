import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/routes.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getProfileRoute());
            },
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/user_icon.png")),
          ),
          Container(
              width: 75,
              height: 75,
              child: Image.asset("assets/images/logo_fill.png")),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getLibraryRoute());
            },
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/album_icon.png")),
          ),
        ],
      ),
    );
  }
}
