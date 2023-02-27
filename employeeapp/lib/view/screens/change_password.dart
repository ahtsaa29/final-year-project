import 'package:employeeapp/services/remote_services.dart';
import 'package:employeeapp/view/widgets/custom_formfield.dart';
import 'package:employeeapp/view/widgets/widget_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController oldController = TextEditingController();
    TextEditingController newController1 = TextEditingController();
    TextEditingController newController2 = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Change password"),
        ),
        body: Column(
          children: [
            Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_1idqu1ac.json",
              height: 300,
            ),
            const WidgetGap(),
            // CustomTextField(
            //     labelText: "Old password", mycontroller: oldController),
            // const WidgetGap(),
            CustomTextField(
                labelText: "new password", mycontroller: newController1),
            const WidgetGap(),
            CustomTextField(
                labelText: "retype new password", mycontroller: newController2),
            const WidgetGap(),
            SizedBox(
              width: Get.size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (newController1.text == "" || newController2.text == "") {
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
                    Map password = {
                      "password": newController1.text,
                      "password2": newController2.text
                    };
                    // print(password);
                    var result = await RemoteServices.changePassword(password);
                    // print(result);
                    if (result != null) {
                      // print(result);
                      Get.defaultDialog(
                        title: "Password changed Succesfully",
                        content: const Text("password updated"),
                        onCancel: () => {},
                        cancel: OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("ok"),
                        ),
                      );
                      newController1.text = "";
                      newController2.text = "";
                    } else {
                      // Get.defaultDialog(
                      //   title: "Credentials error",
                      //   content: const Text("Wrong Credentials provided"),
                      //   onCancel: () => {},
                      //   cancel: OutlinedButton(
                      //     onPressed: () {
                      //       Get.back();
                      //     },
                      //     child: const Text("Retry"),
                      //   ),
                      // );
                    }
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Text(
                  "submit",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
