import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/repos/UserRepo.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

class Profilescreencontroller extends GetxController {
  final _appPref = Get.find<AppPref>();
  final user = Rxn<User>();
  final Userrepo _userrepo = Userrepo();

  RxBool isUserFetched = false.obs;
  RxBool isUserFetchedError = false.obs;
  RxBool isProfileDirty = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCustomerDetails();
  }

  void getCustomerDetails() {
    user.value = _appPref.getUser();
    isProfileDirty.value = false; // Reset dirty state
    if (user.value != null) {
      debugPrint("User fetched successfully from AppPref");
      isUserFetched.value = true;
    } else {
      Customsnackbar.show(
        title: "Error",
        subtitle: "Something went wrong. User not found.",
        type: SnackbarType.error,
      );
      isUserFetched.value = true;
      isUserFetchedError.value = true;
    }
  }

  void updateContactNumber(String newValue) {
    if (user.value != null && user.value!.contactNum != newValue) {
      user.value = user.value!.copyWith(contactNum: newValue);
      isProfileDirty.value = true;
    }
  }

  void updateDateOfBirth(String newValue) {
    if (user.value != null && user.value!.dob != newValue) {
      user.value = user.value!.copyWith(dob: newValue);
      isProfileDirty.value = true;
    }
  }

  void updateLocation(String newValue) {
    if (user.value != null && user.value!.location != newValue) {
      user.value = user.value!.copyWith(location: newValue);
      isProfileDirty.value = true;
    }
  }

  Future<void> saveUserProfile() async {
    if (user.value != null) {
      Loading.show();
      try {
        await _userrepo.updateUser(user.value!);
        Loading.hide();

        _appPref.setUser(user.value!); 
        isProfileDirty.value = false; // Reset on success
        Customsnackbar.show(
          title: "Success",
          subtitle: "Profile updated successfully.",
          type: SnackbarType.success,
        );
      } catch (e) {
        Loading.hide();
        Customsnackbar.show(
          title: "Error",
          subtitle: "Failed to update profile.",
          type: SnackbarType.error,
        );
        getCustomerDetails();
      }
    }
  }
}
