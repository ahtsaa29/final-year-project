// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

List<CompanyModel> companyModelFromJson(String str) => List<CompanyModel>.from(
    json.decode(str).map((x) => CompanyModel.fromJson(x)));

String companyModelToJson(List<CompanyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyModel {
  CompanyModel({
    required this.url,
    required this.companyId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    this.logo,
    required this.panNo,
    required this.addedDate,
  });

  String url;
  int companyId;
  String name;
  int phone;
  String email;
  String address;
  dynamic logo;
  int panNo;
  DateTime addedDate;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        url: json["url"],
        companyId: json["company_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        logo: json["logo"],
        panNo: json["pan_no"],
        addedDate: DateTime.parse(json["added_date"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "company_id": companyId,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "logo": logo,
        "pan_no": panNo,
        "added_date": addedDate.toIso8601String(),
      };
}
