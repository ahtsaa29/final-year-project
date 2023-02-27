import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: SizedBox(
            child: Column(
          children: const [
            ExpansionTile(
              title: Text("data"),
              children: [
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('Blue')),
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('Blue')),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
