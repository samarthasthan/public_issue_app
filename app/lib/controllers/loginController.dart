import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/authentication/signUpModel.dart';

class LoginController extends GetxController {
  RxBool validUser = false.obs;

  void togglevalidUser() {
    validUser.value = !validUser.value;
  }

  Future<SignUpModel> login() async {
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final data = jsonEncode({
      "full_name": "Samarth Asthan",
      "aadhaar_no": "AQGGK453FDSQ1",
      "dob": "2004-07-27",
      "profile":
          "https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg",
      "phone_no": 9557037766,
      "address": "251001",
      "mail": "samarthasthan5@gmail.com"
    });

    final url = Uri.parse('https://afd6-115-240-194-54.ngrok-free.app/signup');

    final res = await http.post(url, headers: headers, body: data);
    final status = res.statusCode;
    if (status != 200) throw Exception('http.post error: statusCode= $status');

    final output = signUpModelFromJson(res.body);
    return output;
  }
}
