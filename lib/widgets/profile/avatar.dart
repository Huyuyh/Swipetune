import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 122,
        height: 122,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar_1.png"),
        ),
      ),
    );
  }
}