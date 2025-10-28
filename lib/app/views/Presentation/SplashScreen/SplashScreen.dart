import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/repos/UserRepo.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final _appPref = Get.find<AppPref>();
  final _userRepo = Userrepo();

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

  void navigateToNext() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      // User is logged in, fetch full profile
      final user = await _userRepo.getUserByUserID(firebaseUser.uid);
      if (user != null) {
        await _appPref.setUser(user);
        Get.offAllNamed(Routes.HOME);
      } else {
        await FirebaseAuth.instance.signOut();
        await _appPref.clearUser();
        Get.offAllNamed(Routes.INTRO_SCREEN);
      }
    } else {
      await _appPref.clearUser();
      Get.offAllNamed(Routes.INTRO_SCREEN);
    }
  }
}
