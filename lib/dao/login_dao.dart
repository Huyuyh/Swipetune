import 'package:get/get.dart';
import 'package:swipetune/services/request.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:swipetune/utils/share_pref.dart';

class LoginDAO {

  Future<bool> isUserLoggedIn() async {
    // final isExpireToken = await expireAccount();
    final accountId = await getAccountID();
    // if (isExpireToken) return false;
    if (accountId == null) {
      return false;
      // setAccountId(accountId);
    }
    return accountId != null;
  }

  Future<void> login(String email, String password, bool isRemember) async {
    String path = "/Account";

    Map<String, String> account = {"Email": email, "Password": password};

    try {
      final response = await ApiService.post(path, null, null, account);

      Map<String, dynamic> decode = Jwt.parseJwt(response.data["token"]);

      print(decode);

      
      setAccountId(decode["Id"]);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
