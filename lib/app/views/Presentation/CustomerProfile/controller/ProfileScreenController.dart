import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/repos/UserRepo.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

class Profilescreencontroller extends GetxController {
  final _appPref = Get.find<AppPref>();
  late User? user;
  Userrepo _userrepo = new Userrepo();

  RxBool isUserFetched = false.obs;
  RxBool isUserFetchedError = false.obs;

  @override
  void onInit() {
    getCustomerDetails();
    super.onInit();
  }

  void getCustomerDetails() {
    String? _userID = _appPref.getUser();
    if (_userID != null && _userID.isNotEmpty) {
      _userrepo.getUserByUserID(_userID).then((value) {
        user = value;
        debugPrint("User Fetch successfully");
        isUserFetched.value = true;
      });
    } else {
      Customsnackbar.show(title: "Error", subtitle: "Something went wrong");
      isUserFetched.value = true;
      isUserFetchedError.value = true;
    }
  }
}
