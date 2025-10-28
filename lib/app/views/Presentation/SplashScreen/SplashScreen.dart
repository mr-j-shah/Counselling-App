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
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    // Initialize services
    await _appPref.init();
    
    // Wait for splash screen duration
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
    // Check the current Firebase user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in, save UID and go to Home
      _appPref.setUser(user.uid);
      Get.offAllNamed(Routes.HOME);
    } else {
      // User is not logged in, clear any old UID and go to Intro
      _appPref.setUser('');
      Get.offAllNamed(Routes.INTRO_SCREEN);
    }
  }
}
