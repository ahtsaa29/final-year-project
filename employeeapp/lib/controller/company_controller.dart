import 'package:employeeapp/model/company_model.dart';
import 'package:employeeapp/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  var companyList = <CompanyModel>[].obs;
  final isLoading = true.obs;
  Future getCompany() async {
    try {
      isLoading(true);
      var company = await RemoteServices.getCompanyData();
      print(company);
      (company != null) ? companyList.value = company : null;
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
    // TODO: implement onInit
    super.onInit();
    getCompany();
  }
}
