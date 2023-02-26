import 'dart:async';
import 'dart:ui';

import 'package:employeeapp/base.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(const BasePage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Employee App",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_dv3etasb.json",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
