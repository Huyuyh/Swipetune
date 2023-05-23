import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/widgets/button/button_large.dart';

class SignInBottom extends StatelessWidget {
  const SignInBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SolidButtonLarge(label: "Sign In", color: Colors.pink),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? "),
              Text("Sign up", 
              style: TextStyle(
                color: Color(0xff31C9CE)
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}