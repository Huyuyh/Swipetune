import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/login/custom_textfield_outline.dart';
import 'package:swipetune/widgets/login/sign_in_bottom.dart';
import 'package:swipetune/widgets/login/sign_in_header.dart';
import 'package:swipetune/widgets/login/sign_up_bottom.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Icon(Icons.arrow_back),
          ),
          onPressed: () {
            Get.back();
          },
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
                  Header(
                    title: "Sign Up",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldOutline(
                    label: "Email",
                    hintText: "Type your email",
                    controller: _emailController,
                  ),
                  CustomTextFieldOutline(
                      label: "Password",
                      hintText: "Type your password",
                      controller: _passwordController,
                      isObscure: true),
                  CustomTextFieldOutline(
                    label: "Phone",
                    hintText: "Type your phone",
                    controller: TextEditingController(),
                  ),
                  // SizedBox(height: 10),
                ],
              ),
            ),
            SignUpBottom(
              emailController: _emailController,
              passwordController: _passwordController,
              phoneController: _phoneController,
            )
          ],
        ),
      ),
    );
  }
}
