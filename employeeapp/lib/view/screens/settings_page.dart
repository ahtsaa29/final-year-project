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
    ValueNotifier<ThemeData> currentTheme = ValueNotifier(lightTheme);

    return ListView(
      children: [
        ExpansionTile(
          title: Text("Theme"),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Theme"),
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
        ListTile(
          title: Text("View Statistics"),
        ),
        ListTile(
          title: Text("Change Password"),
        ),
        ListTile(
          title: Text("Logout"),
        ),
      ],
    );
  }
}
