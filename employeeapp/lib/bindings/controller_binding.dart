import 'package:employeeapp/controller/account_controller.dart';
import 'package:employeeapp/controller/application_controller.dart';
import 'package:employeeapp/controller/company_controller.dart';
import 'package:employeeapp/controller/payroll_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
    Get.put(ApplicationController());
    Get.put(CompanyController());
    Get.put(PayrollController());
  }
}
