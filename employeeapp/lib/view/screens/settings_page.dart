import 'package:employeeapp/view/screens/change_password.dart';
import 'package:employeeapp/view/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
    );
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.purple,
      // add any other properties for the dark theme here
    );
    // ValueNotifier<ThemeData> currentTheme = ValueNotifier(lightTheme);

    return ListView(
      children: [
        ExpansionTile(
          title: const Text("Theme"),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Dark Theme"),
                  Switch(
                    value: Get.isDarkMode,
                    onChanged: (value) {
                      if (value == true) {
                        Get.changeTheme(darkTheme);
                        value = true;
                        setState(() {});
                      } else {
                        Get.changeTheme(lightTheme);
                        value = false;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        const ListTile(
          title: Text("View Statistics"),
          trailing: Icon(Icons.graphic_eq_outlined),
        ),
        GestureDetector(
          onTap: () => Get.to(const ChangePasswordView()),
          child: const ListTile(
            title: Text("Change Password"),
            trailing: Icon(Icons.change_circle_outlined),
          ),
        ),
        GestureDetector(
          onTap: null,
          child: const ListTile(
            title: Text("Forgot Password"),
            trailing: Icon(Icons.device_unknown_outlined),
          ),
        ),
        GestureDetector(
          onTap: () => Get.offAll(const LoginPage()),
          child: const ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.exit_to_app_outlined),
          ),
        ),
      ],
    );
  }
}
