import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

class ChangePasswordController extends GetxController {
  final Authrepo _authRepo = Authrepo();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Customsnackbar.show(
        title: Appstring.error,
        subtitle: Appstring.errorPleaseFillAllFields,
        type: SnackbarType.error,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      Customsnackbar.show(
        title: Appstring.error,
        subtitle: Appstring.errorPasswordsDoNotMatch,
        type: SnackbarType.error,
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      Loading.show();

      final response = await _authRepo.changePassword(currentPassword, newPassword);

      Loading.hide();

      if (response.failedState == Authfailedstate.NONE) {
        Get.back(); // Go back to the previous screen
        Customsnackbar.show(
          title: Appstring.success,
          subtitle: response.message,
          type: SnackbarType.success,
        );
      } else {
        Customsnackbar.show(
          title: Appstring.error,
          subtitle: response.message,
          type: SnackbarType.error,
        );
      }
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
