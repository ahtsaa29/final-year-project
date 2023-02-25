import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text("Theme"),
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
