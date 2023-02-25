import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Employee Name"),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            padding: const EdgeInsets.all(40.0),
            color: Colors.amber[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "hello".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "hello@hello.com",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  child: Text("H"),
                ),
              ],
            ),
          ),
          const Text(
            "account Page",
          ),
        ],
      ),
    ));
  }
}
