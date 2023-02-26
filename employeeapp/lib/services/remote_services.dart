import 'dart:convert';

import 'package:employeeapp/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RemoteServices {
  static var client = http.Client();
  static var baseUrl = "http://127.0.0.1:8000";

  static Future<LoginModel?> loginUser(Map<String, dynamic> login) async {
    try {
      var response = await client.post(
        Uri.parse("$baseUrl/api/user/login/"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(login),
      );
    } catch (e) {
      Get.defaultDialog(title: "Post error", content: Text(e.toString()));
    }
  }
}
