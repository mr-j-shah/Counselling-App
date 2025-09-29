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
                      AppText(text: 'Last updated: July 1, 2025'),
                      SizedBox(height: Dimensions.height(16)),
                      AppText(
                        text: '1. Introduction',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(8)),
                      AppText(
                        text:
                            'Your privacy is important to us. This Privacy Policy explains how our AI Counselling App (“we,” “our,” or “us”) collects, uses, discloses, and protects your personal information when you use our mobile application (“App”). By downloading, accessing, or using the App, you agree to the terms of this policy.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      // 2. Information We Collect
                      AppText(
                        text: '2. Information We Collect',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: '2.1. Personal Information You Provide',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            '- Registration Data: name, email address, date of birth (optional), and password.\n'
                            '- Profile Data: optional demographic or background details you choose to share (e.g., vocation, interests).\n'
                            '- Counselling Inputs: text or voice messages you send to the AI counsellor, including any mood indicators or journaling entries.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: '2.2. Automatically Collected Data',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            '- Usage Data: app usage logs (features accessed, timestamps, session duration).\n'
                            '- Device Data: device type, operating system, app version, unique device identifiers, and language settings.\n'
                            '- Crash Reports & Analytics: anonymous crash logs and performance metrics to improve stability.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: '2.3. Third-Party Data',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'If you choose to sign in with Google or another provider, we obtain the basic profile data (name, email) that you permit.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      AppText(
                        text: '3. How We Use Your Information',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(8)),
                      AppText(
                        text:
                            '- To Provide & Improve the App: personalize the counseling experience, refine AI responses, and fix bugs.\n'
                            '- Analytics & Research: analyze patterns to enhance features and overall user experience.\n'
                            '- Communications: send important updates, security alerts, and support responses.\n'
                            '- Compliance & Safety: detect and prevent abuse, fraud, or illegal activity.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      AppText(
                        text: '4. Data Sharing & Disclosure',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(8)),
                      AppText(
                        text:
                            '- Service Providers: we engage trusted third-party vendors who only process data as instructed.\n'
                            '- Legal Requirements: we will disclose information when required by law or to protect rights, safety, or property.\n'
                            '- Aggregated/Anonymous Data: we may share de-identified data for research or reporting purposes.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      AppText(
                        text: '5. Data Security',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(8)),
                      AppText(
                        text:
                            'We implement industry-standard technical and organizational measures to safeguard your data, including encryption in transit (HTTPS/TLS) and secure storage. However, no system is completely failure-proof; please use strong, unique passwords and notify us of any account concerns.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      AppText(
                        text: 'Contact Us',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(8)),
                      AppText(
                        text:
                            'For questions, concerns, or data requests, please reach out to:\n'
                            'Email: privacy@aicounsellingapp.com\n'
                            'Address: 123 Wellness Way, Suite 100, City, State, ZIP, Country',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(32)),
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
}
