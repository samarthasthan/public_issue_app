import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class LoginCheckController extends GetxController {
  Future<bool> checkLogin() async {
    var token = await APICacheManager().getCacheData("access_token");
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.syncData}',
    };

    final url = Uri.parse("$base_url/checktoken");

    final response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
