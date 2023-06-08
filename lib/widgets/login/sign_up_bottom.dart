

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/resgister_controller.dart';
import 'package:swipetune/widgets/button/button_large.dart';

class SignUpBottom extends StatelessWidget {
  SignUpBottom({Key? key, required this.emailController, required this.passwordController, required this.phoneController})
      : super(key: key);

  final RegisterController _registerController = Get.put(RegisterController());

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) {
        return Column(
          children: [
            SolidButtonLarge(
              label: "Sign Up",
              color: Colors.pink,
              onTap: () {
                // _registerController.login(emailController.text, passwordController.text);
                // Get.toNamed(Routes.getHomePageRoute());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Don't have an account? "),
                Text(
                  "Sign in",
                  style: TextStyle(color: Color(0xff31C9CE)),
                )
              ],
            )
          ],
        );
      },
    );
  }
}