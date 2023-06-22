// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? accessToken;
  String? tokenType;
  String? detail;

  LoginModel({this.accessToken, this.tokenType, this.detail});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      detail: json["detail"]);

  Map<String, dynamic> toJson() =>
      {"access_token": accessToken, "token_type": tokenType, "detail": detail};
}
