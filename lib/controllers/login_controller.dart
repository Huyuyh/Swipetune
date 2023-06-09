import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipetune/dao/login_dao.dart';
import 'package:swipetune/utils/routes.dart';

class LoginController extends GetxController {
  final _isLoading = false.obs;
  final _isLoggedIn = false.obs;
  final _isRemember = false.obs;
  final _tmpAccounId = "".obs;
  final LoginDAO _loginDAO = LoginDAO();

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;
  bool get isRemember => _isRemember.value;
  String get tmpAccountId => _tmpAccounId.value;

  void checkRemember() {
    _isRemember.value = !_isRemember.value;
  }

  void setAccountId(String accountId){
    _tmpAccounId.value=accountId;
  }

  void login(String email, String password) async {
    try {
      _isLoading.value = true;

      await _loginDAO.login(email, password, _isRemember.value);
      // Simulate successful login
      _isLoggedIn.value = true;
    } catch (e) {
      // Handle error
      _isLoggedIn.value = false;
      print('Error: $e');
      Get.dialog(
      AlertDialog(
        title: Text('Login Error'),
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
