import 'package:employeeapp/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ac = Get.find<AccountController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("${ac.isLoading.value}"),
          ],
        ),
      ),
    );
  }
}
