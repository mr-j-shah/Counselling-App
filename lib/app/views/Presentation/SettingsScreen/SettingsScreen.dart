import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/controller/SettingsController.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final SettingsController controller = Get.find<SettingsController>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: 'Settings'),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width(16), vertical: Dimensions.height(20)),
                  children: [
                    _buildSectionTitle('Account settings', textTheme),
                    SizedBox(height: Dimensions.height(10)),
                    _buildSettingsItem(
                      icon: Icons.lock_outline,
                      iconColor: Colors.white,
                      iconBackgroundColor: Colors.redAccent,
                      title: 'Change Password',
                      onTap: controller.changePassword,
                    ),
                    _buildSettingsItem(
                      icon: Icons.notifications_none_outlined,
                      iconColor: Colors.white,
                      iconBackgroundColor: Colors.green,
                      title: 'Notifications',
                      onTap: controller.goToNotificationsSettings,
                    ),
                    _buildSettingsItem(
                      icon: Icons.bar_chart_outlined,
                      iconColor: Colors.white,
                      iconBackgroundColor: Colors.blueAccent,
                      title: 'Statistics',
                      onTap: controller.goToStatistics,
                    ),
                    _buildSettingsItem(
                      icon: Icons.person_outline,
                      iconColor: Colors.white,
                      iconBackgroundColor: Colors.orangeAccent,
                      title: 'About us',
                      onTap: controller.goToAboutUs,
                    ),
                    SizedBox(height: Dimensions.height(24)),
                    _buildSectionTitle('More options', textTheme),
                    SizedBox(height: Dimensions.height(10)),
                    _buildToggleItem(
                        title: 'Text messages',
                        value: controller.textMessagesEnabled,
                        onChanged: controller.toggleTextMessages,
                        textTheme: textTheme),
                    _buildToggleItem(
                        title: 'Phone calls',
                        value: controller.phoneCallsEnabled,
                        onChanged: controller.togglePhoneCalls,
                        textTheme: textTheme),
                    Obx(() => _buildSettingsItem(
                          title: 'Languages',
                          trailingText: controller.selectedLanguage.value,
                          onTap: controller.changeLanguage,
                        )),
                    Obx(() => _buildSettingsItem(
                          title: 'Currency',
                          trailingText: controller.selectedCurrency.value,
                          onTap: controller.changeCurrency,
                        )),
                    Obx(() => _buildSettingsItem(
                          title: 'Linked accounts',
                          trailingText: controller.linkedAccounts.value,
                          onTap: controller.manageLinkedAccounts,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height(8)),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _buildSettingsItem({
    IconData? icon,
    Color? iconColor,
    Color? iconBackgroundColor,
    required String title,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon != null
          ? Container(
              padding: EdgeInsets.all(Dimensions.padding(6)),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius(8)),
              ),
              child: Icon(icon, color: iconColor, size: Dimensions.font(20)),
            )
          : null,
      title: Text(title, style: TextStyle(fontSize: Dimensions.font(16))),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(trailingText, style: TextStyle(fontSize: Dimensions.font(14), color: Colors.grey.shade600)),
          SizedBox(width: Dimensions.width(8)),
          Icon(Icons.arrow_forward_ios, size: Dimensions.font(14), color: Colors.grey.shade400),
        ],
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width(16), vertical: Dimensions.height(4)),
    );
  }

  Widget _buildToggleItem({
    required String title,
    required RxBool value,
    required ValueChanged<bool> onChanged,
    required TextTheme textTheme,
  }) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: Dimensions.font(16))),
      trailing: Obx(() => Switch(
            value: value.value,
            onChanged: onChanged,
            activeColor: Colors.green,
          )),
      contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width(16), vertical: Dimensions.height(4)),
    );
  }
}
