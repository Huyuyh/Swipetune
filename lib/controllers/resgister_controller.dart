


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/dao/login_dao.dart';
import 'package:swipetune/utils/routes.dart';

class RegisterController extends GetxController {

  final _isLoading = false.obs;
  final _isLoggedIn = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;

  final LoginDAO _loginDAO = LoginDAO();


  void register(String email, String password, String phone) async {
    try {
      _isLoading.value = true;
      await _loginDAO.register(email, password, phone);
      // Get.toNamed(Routes.getStartUp());
      // Simulate successful login
      _isLoggedIn.value = true;
    } catch (e) {
      // Handle error
      _isLoggedIn.value = false;
      print('Error: $e');
      Get.dialog(
      AlertDialog(
        title: Text('Register Error'),
        content: Text('An error occurred during login: ${e}'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
    } finally {
      _isLoading.value = false;
    }
  }

}