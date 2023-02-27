// To parse this JSON data, do
//
//     final passwordModel = passwordModelFromJson(jsonString);

import 'dart:convert';

PasswordModel passwordModelFromJson(String str) =>
    PasswordModel.fromJson(json.decode(str));

String passwordModelToJson(PasswordModel data) => json.encode(data.toJson());

class PasswordModel {
  PasswordModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory PasswordModel.fromJson(Map<String, dynamic> json) => PasswordModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.password,
    required this.password2,
  });

  String password;
  String password2;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        password: json["password"],
        password2: json["password2"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "password2": password2,
      };
}
