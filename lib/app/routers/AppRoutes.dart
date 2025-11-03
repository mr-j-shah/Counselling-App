import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/AboutUsScreen/AboutUsScreen.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/BreathingExerciseScreen.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/binding/BreathingBinding.dart';
import 'package:project_counselling/app/views/Presentation/ChangePassword/ChangePasswordScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChangePassword/binding/ChangePasswordBinding.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/ChatHistoryDetailScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/ChatHistoryScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/bindings/ChatHistoryBindings.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/SignupScreen/SignupScreen.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/binding/Authbinding.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/ProfieScreen.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/bindings/ProfileScreenBindings.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/HelpCenterScreen.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/HelpTopicDetailScreen.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpTopic.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/bindings/HomeBinding.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/IntroScreen.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/bindings/IntroBindings.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:project_counselling/app/views/Presentation/PopularProfiles/PopularProfilesScreen.dart';
import 'package:project_counselling/app/views/Presentation/PopularProfiles/binding/PopularProfilesBinding.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/SettingsScreen.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/bindings/SettingsBinding.dart';
import 'package:project_counselling/app/views/Presentation/SplashScreen/SplashScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/binding/SpeechBindings.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/HomeScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/SpeechScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChatScreen/UserChatScreen.dart';
import 'package:project_counselling/app/views/Presentation/TopDoctors/TopDoctorsScreen.dart';
import 'package:project_counselling/app/views/Presentation/TopDoctors/binding/TopDoctorsBinding.dart';

import '../views/Presentation/AvatarDetailScreen/AvatarDetailScreen.dart';
import '../views/Presentation/AvatarDetailScreen/binding/AvatarDetailBinding.dart';
import '../views/Presentation/Legal/PrivacyPolicyScreen.dart';
import '../views/Presentation/Legal/TermsAndService.dart';

abstract class Routes {
  static const String HOME = '/home';
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String SPEECH_TEXT = '/speech-text';
  static const String USER_CHAT = '/user-chat';
  static const String INTRO_SCREEN = '/intro-screen';
  static const String LOGIN_SCREEN = '/login-screen';
  static const String SIGNUP_SCREEN = '/signup-screen';
  static const String POLICY_SCREEN = '/policy-screen';
  static const String TERMS_SERVICE_SCREEN = '/terms-service-screen';
  static const String PROFILE_SCREEN = '/profile-screen';
  static const String HELP_CENTER_SCREEN = '/help-center-screen';
  static const String HELP_TOPIC_DETAIL_SCREEN = '/help-topic-detail-screen';
  static const String SETTINGS_SCREEN = '/settings-screen';
  static const String MEDICAL_RECORDS_SCREEN = '/medical-records-screen';
  static const String ADD_RECORDS_SCREEN = '/add-records-screen';
  static const String ABOUT_US_SCREEN = '/about-us-screen';
  static const String CHANGE_PASSWORD_SCREEN = '/change-password-screen';
  static const String POPULAR_PROFILES_SCREEN = '/popular-profiles-screen';
  static const String TOP_DOCTORS_SCREEN = '/top-doctors-screen';
  static const String BREATHING_EXERCISE_SCREEN = '/breathing-exercise-screen';
  static const String AVATAR_DETAIL_SCREEN = '/avatar-detail-screen';
  static const String CHAT_HISTORY_DETAIL_SCREEN = '/chat-history-detail-screen';
  static const String CHAT_HISTORY_SCREEN = '/chat-history-screen';
}

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: Homebinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.SPEECH_TEXT,
      page: () => SpeechScreen(),
      binding: SpeechBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.USER_CHAT,
      page: () => UserChatScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: Routes.SPLASH_SCREEN, page: () => Splashscreen()),
    GetPage(
      name: Routes.INTRO_SCREEN,
      page: () => Introscreen(),
      binding: Introbindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      binding: Authbinding(),
      name: Routes.LOGIN_SCREEN,
      page: () => Loginscreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.SIGNUP_SCREEN,
      page: () => Signupscreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.POLICY_SCREEN,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.TERMS_SERVICE_SCREEN,
      page: () => TermsAndServiceScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.PROFILE_SCREEN,
      binding: Profilescreenbindings(),
      page: () => ProfileScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HELP_CENTER_SCREEN,
      page: () => HelpCenterScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HELP_TOPIC_DETAIL_SCREEN,
      page: () {
        final HelpTopic topic = Get.arguments as HelpTopic;
        return HelpTopicDetailScreen(topic: topic);
      },
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.SETTINGS_SCREEN,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.ABOUT_US_SCREEN,
      page: () => const AboutUsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD_SCREEN,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.POPULAR_PROFILES_SCREEN,
      page: () => const PopularProfilesScreen(),
      binding: PopularProfilesBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.TOP_DOCTORS_SCREEN,
      page: () => const TopDoctorsScreen(),
      binding: TopDoctorsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.BREATHING_EXERCISE_SCREEN,
      page: () => const BreathingExerciseScreen(),
      binding: BreathingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.AVATAR_DETAIL_SCREEN,
      page: () => const AvatarDetailScreen(),
      binding: AvatarDetailBinding(),
      transition: Transition.cupertino,
    ),GetPage(
      name: Routes.CHAT_HISTORY_SCREEN,
      page: () => const ChatHistoryScreen(),
      binding: ChatHistoryBindings(),
      transition: Transition.cupertino,
    ),GetPage(
      name: Routes.CHAT_HISTORY_DETAIL_SCREEN,
      page: () => const ChatHistoryDetailScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
