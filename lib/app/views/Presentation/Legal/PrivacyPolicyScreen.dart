import 'package:flutter/material.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: Appstring.privacyPolicy),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: 'Last updated: Nov 3, 2024'),
                      SizedBox(height: Dimensions.height(16)),
                      _buildSectionTitle('1. Introduction', textTheme),
                      _buildSectionContent(
                        'Welcome to our AI Counselling App. Your privacy is critically important to us. This Privacy Policy outlines how we collect, use, and protect your information when you use our application. By using our app, you agree to the collection and use of information in accordance with this policy.',
                        textTheme,
                      ),
                      _buildSectionTitle('2. Information We Collect', textTheme),
                      _buildSubSectionTitle('2.1. Information You Provide', textTheme),
                      _buildSectionContent(
                        '- Account Information: When you create an account, we collect your name, email address, and password.\n'
                        '- Profile Details: You may voluntarily add information to your profile, such as a profile picture, contact number, date of birth, and location.\n'
                        '- Conversation Data: We process the text or voice inputs you provide during your chat sessions with our AI personas to generate responses. If you save a session, we store the conversation history, including the title you provide and the AI persona (Avatar) you interacted with.',
                        textTheme,
                      ),
                      _buildSubSectionTitle('2.2. Information From Third Parties', textTheme),
                      _buildSectionContent(
                        'If you sign in using a third-party service like Google, we receive information from that service, such as your name, email, and public profile picture, as permitted by your privacy settings on that service.',
                        textTheme,
                      ),
                      _buildSectionTitle('3. How We Use Your Information', textTheme),
                      _buildSectionContent(
                        'Your information is used to:\n'
                        '- Provide, operate, and maintain our services, including generating AI responses and personalizing your experience.\n'
                        '- Allow you to save and review your chat sessions.\n'
                        '- Authenticate your account and manage your profile.\n'
                        '- Improve our app by analyzing usage patterns and performance data.\n'
                        '- Communicate with you for purposes like password resets or important service notices.',
                        textTheme,
                      ),
                      _buildSectionTitle('4. Data Storage and Security', textTheme),
                      _buildSectionContent(
                        'We use Google\'s Firebase services (Firestore, Firebase Authentication) to securely store your data. All data is encrypted in transit and at rest. While we take your data\'s security very seriously, no system is 100% secure, and we cannot guarantee absolute security.',
                        textTheme,
                      ),
                       _buildSectionTitle('5. Your Data Rights and Choices', textTheme),
                      _buildSectionContent(
                        '- Access and Update: You can review and update your profile information at any time in the \'Profile\' section.\n'
                        '- Deletion: You can delete any of your saved chat sessions from the \'My Sessions\' screen. This action is permanent.\n'
                        '- Account Deletion: If you wish to delete your entire account, please contact us at the email address provided below. Please note that this will permanently erase all your data, including saved sessions and profile information.',
                        textTheme,
                      ),
                      _buildSectionTitle('6. Children\'s Privacy', textTheme),
                      _buildSectionContent(
                        'Our service is not intended for individuals under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have collected such data, we will take steps to delete it.',
                        textTheme,
                      ),
                      _buildSectionTitle('7. Changes to This Privacy Policy', textTheme),
                      _buildSectionContent(
                        'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy in this section. We recommend reviewing this policy periodically for any updates.',
                        textTheme,
                      ),
                      _buildSectionTitle('8. Contact Us', textTheme),
                      _buildSectionContent(
                        'If you have any questions or concerns about this Privacy Policy, please contact us at: shahjinay02@gmail.com',
                        textTheme,
                      ),
                    ],
                  ),
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
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: AppText(
        text: title,
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubSectionTitle(String title, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: AppText(
        text: title,
        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSectionContent(String content, TextTheme textTheme) {
    return AppText(
      text: content,
      style: textTheme.bodyMedium,
    );
  }
}
