// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipetune/widgets/button/button_large.dart';
import 'package:swipetune/widgets/button/button_outline_large.dart';
import 'package:swipetune/widgets/login/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_background_img.png'),
                fit: BoxFit.cover),

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.3),
              ],
            ),
            backgroundBlendMode: BlendMode.srcOver,
            // Use backgroundBlendMode to set the blend mode for the overlays
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.4896, 1],
                    colors: [
                      Color(0xff31c9ce),
                      Color.fromRGBO(255, 255, 255, 0.31),
                      Color(0xffff7d87),
                    ],
                  ),
                  backgroundBlendMode: BlendMode.screen,
                  // Use backgroundBlendMode to set the blend mode for the gradient
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(42, 0, 42, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Logo(),
                      SizedBox(height: 20),
                      SolidButtonLarge(label: "Sign up", color: Colors.pink),
                      SizedBox(height: 20),
                      OutlineButtonLarge(
                        label: "Continue with phone number",
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        fontsize: 16,
                        iconData: Icons.phone_android
                      ),
                      SizedBox(height: 20),
                      OutlineButtonLarge(
                        label: "Continue with google",
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        fontsize: 16,
                        iconData: FontAwesomeIcons.google
                      ),
                      SizedBox(height: 20),
                      OutlineButtonLarge(
                        label: "Continue with apple",
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        fontsize: 16,
                        iconData: Icons.apple
                      ),
                      SizedBox(height: 20),
                      OutlineButtonLarge(
                        label: "Continue with facebook",
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        fontsize: 16,
                        iconData: Icons.facebook
                      ),
                       OutlineButtonLarge(
                        label: "Log in",
                        color: Colors.transparent,
                        fontsize: 16,
                      ),
                      SizedBox(height: 20),

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
