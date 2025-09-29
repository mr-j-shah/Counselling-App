import 'package:flutter/material.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class TermsAndServiceScreen extends StatelessWidget {
  const TermsAndServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Terms of Service"),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: 'Last updated: July 1, 2025'), // You can change this date
                      SizedBox(height: Dimensions.height(16)),

                      // 1. Data Privacy and Consent (Voice Data)
                      AppText(
                        text: '1. Data Privacy and Consent (Voice Data) 🗣️',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Explicit Consent for Recording:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Users must explicitly agree to have their voice recorded and stored for processing.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Purpose of Collection:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Clearly state why the voice data is being collected (e.g., to transcribe, analyze, and generate a therapeutic response).',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Storage and Retention:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Detail how long the voice recordings and their corresponding transcripts are stored and the security measures used to protect them.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Anonymization/Identification:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Specify whether the voice data is linked directly to the user\'s identity or if it\'s anonymized for LLM training or analysis.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),

                      // 2. Scope and Limitation of Service (Counselling)
                      AppText(
                        text: '2. Scope and Limitation of Service (Counselling) ⚠️',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Not a Medical or Therapeutic Service:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'State unequivocally that the application is not a licensed medical or professional therapy service and that the LLM\'s responses are not a substitute for diagnosis, treatment, or advice from a qualified mental health professional.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Emergency Disclaimer:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Provide clear, bold instructions for users to contact emergency services (e.g., 911 or a crisis hotline) if they are in immediate danger or experiencing a mental health crisis.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Accuracy Disclaimer:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Disclaim responsibility for the accuracy, completeness, or suitability of the LLM\'s automated advice.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),

                      // 3. Intellectual Property and Content License
                      AppText(
                        text: '3. Intellectual Property and Content License',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'User Voice/Content License:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Users must grant you a license to the voice data and text transcripts they provide so that you can legally process them and generate the LLM\'s reply (i.e., you need permission to use their content to run your service).',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'LLM Output Ownership:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Clarify that the text generated by the LLM (the reply) is part of your service content and protected by your copyright, though the user is generally permitted to use it for personal, non-commercial purposes.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),

                      // 4. User Conduct and Appropriate Use
                      AppText(
                        text: '4. User Conduct and Appropriate Use',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'No Illegal or Harmful Content:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Prohibit users from using the app to record or transmit voice content that is illegal, defamatory, threatening, or harmful. This is especially important for voice-based input where emotional distress might be high.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Misuse of Service:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Prohibit using the app for non-counselling purposes or attempting to manipulate the LLM\'s response.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(24)),

                      // 5. Third-Party Services (The LLM)
                      AppText(
                        text: '5. Third-Party Services (The LLM)',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Third-Party Disclosure:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Disclose that user voice data (or its transcription) is sent to a third-party service provider (the LLM) for processing and generation of the reply.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(12)),
                      AppText(
                        text: 'Linking to LLM\'s Terms/Privacy:',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(
                        text:
                            'Reference or link to the specific terms and privacy policy of the LLM provider, as they will have their own rules regarding the data you send them.',
                        style: textTheme.bodyMedium,
                      ),
                      SizedBox(height: Dimensions.height(32)), // Extra padding at the end
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
