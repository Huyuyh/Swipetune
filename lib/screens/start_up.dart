import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swipetune/controllers/start_up_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class StartUp extends StatelessWidget {
  StartUp({super.key});

  final StartUpController _startUpController = Get.put(StartUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartUpController>(
      init: StartUpController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            // color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_startUpController.isLoading) ...[
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo_fill.png',
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
