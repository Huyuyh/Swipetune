import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/login_controller.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/widgets/button/button_large.dart';

class SignInBottom extends StatelessWidget {
  SignInBottom({Key? key, required this.emailController, required this.passwordController})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Column(
          children: [
            SolidButtonLarge(
              label: "Sign In",
              color: Colors.pink,
              onTap: () {
                _loginController.login(emailController.text, passwordController.text);
                // Get.toNamed(Routes.getHomePageRoute());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                Text(
                  "Sign up",
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
