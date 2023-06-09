// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/routes.dart';
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
                Color.fromRGBO(0, 0, 0, 0.5),
                Color.fromRGBO(0, 0, 0, 0.5),
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
                      Color.fromARGB(255, 0, 179, 255),
                      Color.fromRGBO(224, 9, 9, 0.31),
                      Color.fromARGB(255, 239, 6, 6),
                    ],
                  ),
                  backgroundBlendMode: BlendMode.screen,
                  // Use backgroundBlendMode to set the blend mode for the gradient
                ),
              ),
              Center(
                child: Padding(
                  padding: sPadding(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Logo(),
                      SizedBox(height: 20),
                      SolidButtonLarge(label: "Sign up", color: Colors.pink,
                      onTap: () {
                        Get.toNamed(Routes.getSignUpRoute());
                      },
                      ),
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
                      
                      
                       OutlineButtonLarge(
                        label: "Log in",
                        color: Colors.transparent,
                        fontsize: 20,
                         onTap: () {
                        Get.toNamed(Routes.getSignInRoute());
                      },
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
