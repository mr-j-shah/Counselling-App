import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final _appPref = Get.find<AppPref>();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      navigateToNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: Center(child: Image.asset('assets/images/Splash_Logo.png')),
      ),
    );
  }

  void navigateToNext() {
    String? userId = _appPref.getUser();
    if (userId != null && userId.isNotEmpty) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.INTRO_SCREEN);
    }
  }
}
