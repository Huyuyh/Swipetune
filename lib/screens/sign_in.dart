import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/login_controller.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/widgets/login/custom_textfield_outline.dart';
import 'package:swipetune/widgets/login/sign_in_bottom.dart';
import 'package:swipetune/widgets/login/sign_in_header.dart';
import 'package:swipetune/widgets/profile/custom_texfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

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
                  Header(title: "Sign In"),
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
                  // SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Container(
                                child: Checkbox(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: _loginController
                                      .isRemember, // Replace with your checkbox logic
                                  onChanged: (value) {
                                    _loginController.checkRemember();
                                  },
                                ),
                              )),
                          Text("Remember Me"),
                        ],
                      ),
                      Text("Forgot Me?"),
                    ],
                  ),
                ],
              ),
            ),
            SignInBottom(
              emailController: _emailController,
              passwordController: _passwordController,
            )
          ],
        ),
      ),
    );
  }
}
