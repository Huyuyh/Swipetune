import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

Future<bool> expireAccount() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(prefs.getString('expireDate')!);
    return tempDate.compareTo(DateTime.now()) < 0;
  } catch (e) {
    return true;
  }
}

Future<bool> setAccountId(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // String expireDate = DateFormat("yyyy-MM-dd hh:mm:ss")
  //     .format(DateTime.now().add(Duration(days: 20)));
  // prefs.setString('expireDate', expireDate.toString());
  return prefs.setString('accountId', value);
}

Future<bool> setPremiumAccount(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  return prefs.setString('premium', value);
}

Future<bool> setAccessToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('accessToken', value);
}


Future<String?> getPremiumAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('premium');
}

Future<String?> getAccountID() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('accountId');
}


Future<String?> getAccessToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('accessToken');
}


Future<bool> setIsFirstOnboard(bool isFirstOnboard) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool('isFirstOnBoard', isFirstOnboard);
}

Future<bool?> getIsFirstOnboard() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isFirstOnBoard');
}

Future<void> removeALL() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}