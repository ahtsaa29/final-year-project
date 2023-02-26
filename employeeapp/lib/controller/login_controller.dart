import 'package:employeeapp/model/login_model.dart';
import 'package:employeeapp/services/remote_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
  var loginDetails = <LoginModel>{}.obs;
  var isLoggedIn = false.obs;

  Future<LoginModel?> loginHandle(Map<String, dynamic> login) async {
    try {
      isLoading(true);
      // var loginData = login.toString();
      var loginResponse = await RemoteServices.loginUser(login);
      if (loginResponse != null) {
        // Login was successful, do something with the response
        // var authToken =log;
        // ...
      } else {
        // Login was not successful, handle the error
        // ...
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
