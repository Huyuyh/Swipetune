import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/login/custom_textfield_outline.dart';
import 'package:swipetune/widgets/login/sign_in_bottom.dart';
import 'package:swipetune/widgets/login/sign_in_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: sPadding(),
        child: Column(
          children: [
            Container(
              height: 600,
              child: Column(
                children: [
                  Header(title: "Sign Up",),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldOutline(
                    label: "Email",
                    hintText: "Type your email",
                  ),
                  CustomTextFieldOutline(
                      label: "Password",
                      hintText: "Type your password",
                      isObscure: true),
                  // SizedBox(height: 10),
                  
                ],
              ),
            ),
            SignInBottom()
          ],
        ),
      ),
    );
  }
}