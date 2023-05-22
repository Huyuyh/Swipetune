import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 50,
              height: 50,
              child: Image.asset("assets/images/user_icon.png")),
          Container(
              width: 75,
              height: 75,
              child: Image.asset("assets/images/logo_fill.png")),
          Container(
              width: 50,
              height: 50,
              child: Image.asset("assets/images/album_icon.png")),
        ],
      ),
    );
  }
}
