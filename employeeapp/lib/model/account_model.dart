// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.address,
    this.designation,
    this.panNo,
  });

  int id;
  String email;
  String name;
  dynamic phone;
  dynamic address;
  dynamic designation;
  dynamic panNo;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        designation: json["designation"],
        panNo: json["pan_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "address": address,
        "designation": designation,
        "pan_no": panNo,
      };
}
