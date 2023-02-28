import 'package:employeeapp/model/account_model.dart';
import 'package:employeeapp/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static var profile = <AccountModel?>{}.obs;
  final isLoading = true.obs;
  Future getAccountData() async {
    try {
      isLoading(true);
      var account = await RemoteServices.getAccount();
      print(" account = $account");
      (account != null) ? profile.value = {account} : null;
      print(profile.value);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Controller error",
        content: Text(
          e.toString(),
        ),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAccountData();
  }
}
