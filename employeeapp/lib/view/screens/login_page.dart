import 'package:employeeapp/base.dart';
import 'package:employeeapp/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_formfield.dart';
import '../widgets/widget_gap.dart';

class LoginPage extends StatelessWidget {
  static var authtoken = "";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                textScaleFactor: 1.4,
                style: TextStyle(fontSize: 26.0),
              ),
              const WidgetGap(),
              const WidgetGap(),
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "abcd@user.com",
                      mycontroller: emailController,
                    ),
                    const WidgetGap(),
                    CustomTextField(
                        labelText: "password",
                        mycontroller: passwordController),
                    const WidgetGap(),
                    SizedBox(
                      width: Get.size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onPressed: () async {
                          if (emailController.text == "" &&
                              passwordController.text == "") {
                            Get.defaultDialog(
                              title: "Credentials error",
                              content: const Text("empty Credentials provided"),
                              onCancel: () => {},
                              cancel: OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Retry"),
                              ),
                            );
                          } else {
                            Map user = {
                              "email": emailController.text,
                              "password": passwordController.text
                            };
                            var result =
                                await RemoteServices.loginService(user);
                            if (result != null) {
                              authtoken = result.token.access;
                              // print(authtoken);
                              Get.to(() => const BasePage());
                              // Get.to(() => const ChangePasswordView());
                              emailController.text = "";
                              passwordController.text = "";
                            } else {
                              Get.defaultDialog(
                                title: "Credentials error",
                                content:
                                    const Text("Wrong Credentials provided"),
                                onCancel: () => {},
                                cancel: OutlinedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Retry"),
                                ),
                              );
                            }
                          }
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
