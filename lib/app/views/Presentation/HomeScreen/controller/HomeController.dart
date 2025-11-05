import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

import '../../../../data/models/Avatar.dart';
import '../../../../repos/AvatarRepo.dart';

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

  @override
  void onInit() {
    super.onInit();
    fetchAvatars();
    user = _appPref.getUser();
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

  void navigateToBoxBreathing() {
    Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN);
  }

  String getUserName() {
    return user?.name.trim().isNotEmpty == true ? user!.name : "User";
  }

  String getUserProfilePhoto() {
    return user?.profileImage ?? "";
  }

  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}
