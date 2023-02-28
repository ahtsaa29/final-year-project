import 'dart:convert';

import 'package:employeeapp/model/account_model.dart';
import 'package:employeeapp/model/company_model.dart';
import 'package:employeeapp/model/login_model.dart';
import 'package:employeeapp/model/password_model.dart';
import 'package:employeeapp/view/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://127.0.0.1:8000/api";

  static Future<LoginModel?> loginService(Map login) async {
    try {
      // print(login);
      var response = await client.post(
        Uri.parse("$baseUrl/user/login/"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(login),
      );
      if (response.statusCode == 201) {
        // print(response.statusCode);
        // print(response.body);
        var data = response.body;
        return loginModelFromJson(data);
      } else {
        // var data = response.body;
        // print(data);
        return null;
      }
    } catch (e) {
      // print(e);
      Get.defaultDialog(title: "Post error", content: Text(e.toString()));
      return null;
    }
  }

  static Future<PasswordModel?> changePassword(Map password) async {
    try {
      // print(LoginPage.authtoken);
      var response = await client.post(
        Uri.parse("$baseUrl/user/changepassword/"),
        headers: {
          "Authorization": "Bearer ${LoginPage.authtoken}",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(password),
      );
      if (response.statusCode == 200) {
        var data = response.body;
        return passwordModelFromJson(data);
      } else {
        // var data = response.body;
        // print(data);
        throw "Failed to change password";
      }
    } catch (e) {
      // print(e);
      Get.snackbar("Change password error", e.toString());
      return null;
    }
  }

  static Future<List<CompanyModel>?> getCompanyData() async {
    try {
      // print(LoginPage.authtoken);
      var response = await client.get(
        Uri.parse("$baseUrl/userdetails/company/"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        return companyModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      Get.defaultDialog(
        title: "ServiceError",
        content: Text(
          e.toString(),
        ),
      );
    }
  }

  static Future<AccountModel?> getAccount() async {
    try {
      var response = await client.post(
        Uri.parse("$baseUrl/user/profile/"),
        headers: {
          "Authorization": "Bearer ${LoginPage.authtoken}",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return accountModelFromJson(jsonString);
      } else {
        print(response.statusCode);
        print(response.body);
        throw "couldnt fetch";
      }
    } catch (e) {
      // print(e);
      Get.defaultDialog(
        title: "ServiceError",
        content: Text(
          e.toString(),
        ),
      );
      return null;
    }
  }
}
