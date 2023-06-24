import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swipetune/controllers/genre_controller.dart';
import 'package:swipetune/controllers/login_controller.dart';
import 'package:swipetune/services/request.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:swipetune/services/spotify_service.dart';
import 'package:swipetune/utils/constants.dart';
import 'package:swipetune/utils/routes.dart';
import 'package:swipetune/utils/share_pref.dart';

class LoginDAO {
  Future<bool> isUserLoggedIn() async {
    final isExpireToken = await expireAccount();
    final accountId = await getAccountID();
    if (isExpireToken) return false;
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


      if (decode["isFirstTime"]) {
        Get.put(GenreController());
        Get.toNamed(Routes.getAbout());
        Get.find<LoginController>().setAccountId(decode["Id"]);
        Get.find<GenreController>().fetchGenre();
        return;
      } else {
        setAccountId(decode["Id"]);
        if(decode["Subscription Name"] == "PREMIUM"){
          setPremiumAccount("PREMIUM");
        }
        Get.offAndToNamed(Routes.getStartUp());
      }

      // setIsFirstOnboard(decode["isFirstTime"]);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> register(String email, String password, String phone) async {
    String path = "/Account/register";

    Map<String, String> account = {
      "Email": email,
      "Password": password,
      "DOB": formatDate(DateTime.now()),
      "Gender": "string",
      "PhoneNumber": phone,
      "Address": "string"
    };

    try {
      final response = await ApiService.post(path, null, null, account);

      // Map<String, dynamic> decode = Jwt.parseJwt(response.data["token"]);

      // print(decode);

      // setAccountId(decode["Id"]);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
