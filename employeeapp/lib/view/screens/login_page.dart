// import 'package:dataapp/services/remoteservices.dart';
// import 'package:dataapp/views/data.dart';
import 'package:employeeapp/controller/login_controller.dart';
import 'package:employeeapp/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                textScaleFactor: 1.4,
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "abcd@user.com",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "password",
                      ),
                    ),
                    SizedBox(
                      width: Get.size.width * 0.8,
                      child: ElevatedButton(
                        child: const Text("Login"),
                        onPressed: () async {
                          Map user = {
                            "email": emailController.text,
                            "password": passwordController.text
                          };

                          // RemoteServices.loginUser(user);
                          // print(student);
                          Get.snackbar("success", "Student added successfulyy");
                          emailController.text = "";
                          passwordController.text = "";
                          FocusScope.of(context).unfocus();
                          // Get.offAll();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
