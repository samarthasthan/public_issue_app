import 'package:app/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/authentication/logInModel.dart';

class LoginController extends GetxController {
  Future<LoginModel> login(String phone) async {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final data =
        '{\n  "aadhaar_no": "4c3348a7aef55c2f06fc6d4b526aa38e",\n  "phone_no":' +
            phone +
            '\n}';

    final url = Uri.parse(base_url + "/login");

    final res = await http.post(url, headers: headers, body: data);
    // final status = res.statusCode;
    // if (status != 200) throw Exception('http.post error: statusCode= $status');

    return loginModelFromJson(res.body);
  }
}
