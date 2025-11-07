import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

import '../../../../data/models/Avatar.dart';
import '../../../../repos/AvatarRepo.dart';
import 'package:collection/collection.dart';


class Homecontroller extends GetxController {
  var isMenuOpen = false.obs;
  final AppPref _appPref = Get.find<AppPref>();
  User? user;

  // To manage the selected tab index for bottom navigation
  var selectedTabIndex = 0.obs;
  var appBarOpacity = true.obs;

  final AvatarRepo _avatarRepo = AvatarRepo();
  var avatarList = <Avatar>[].obs;
  var isLoading = true.obs;
  final BreathingRepository _breathingRepository = Get.find<BreathingRepository>();
  var showStreakCard = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchAvatars();
    user = _appPref.getUser();
    checkBreathingStreak();
    print("HomeController initialized!");
  }

  void fetchAvatars() async {
    try {
      isLoading(true);
      avatarList.value = await _avatarRepo.getAvatars();
    } finally {
      isLoading(false);
    }
  }

  void checkBreathingStreak() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dayBefore = today.subtract(const Duration(days: 2));

    // Fetch sessions from the last 3 days to check the streak
    final sessions = await _breathingRepository.getSessionsBetweenDates(dayBefore, now);

    // Check if there was a session yesterday or the day before
    final hadRecentSession = sessions.any((s) => s.timestamp.isAfter(dayBefore) && s.timestamp.isBefore(today));

    // Check if there was a session today
    final hadSessionToday = sessions.any((s) => s.timestamp.isAfter(today));

    // If there was a recent session but no session today, show the card
    if (hadRecentSession && !hadSessionToday) {
      showStreakCard.value = true;
    } else {
      showStreakCard.value = false;
    }
  }


  @override
  void onClose() {
    print("HomeController disposed!");
    super.onClose();
  }

  List<Avatar> get  homeScreenAvatars => avatarList.take(5).toList();

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
    if(index == 0 ){
      appBarOpacity.value = true;
    }else{
      appBarOpacity.value = false;
    }
  }

  void navigateToFreeCounselling() {
    Get.toNamed(Routes.SPEECH_TEXT);
  }

  void navigateToBoxBreathing() async {
    await Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN);
    checkBreathingStreak(); // Re-check streak when returning
  }

  String getUserName() {
    return user?.name.trim().isNotEmpty == true ? user!.name : "User";
  }

  String getUserProfilePhoto() {
    return user?.profileImage ?? "";
  }

  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}
