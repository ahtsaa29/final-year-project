// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.token,
    required this.message,
  });

  Token token;
  String message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: Token.fromJson(json["token"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "message": message,
      };
}

class Token {
  Token({
    required this.refresh,
    required this.access,
    required this.timeStamp,
  });

  String refresh;
  String access;
  DateTime timeStamp;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
        timeStamp: DateTime.parse(json["time_stamp"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "time_stamp": timeStamp.toIso8601String(),
      };
}
