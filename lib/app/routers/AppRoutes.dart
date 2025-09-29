import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/SignupScreen/SignupScreen.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/binding/Authbinding.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/ProfieScreen.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/bindings/ProfileScreenBindings.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/bindings/HomeBinding.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/IntroScreen.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/bindings/IntroBindings.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:project_counselling/app/views/Presentation/SplashScreen/SplashScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/binding/SpeechBindings.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/HomeScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/SpeechScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChatScreen/UserChatScreen.dart';

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
    // GetPage(
    //   name: Routes.DETAILS,
    //   page: () => DetailsScreen(),
    //   binding: DetailsBinding(),
    //   // Apply middleware to protect this route
    //   middlewares: [
    //     AuthMiddleware(), // This will check authentication before entering DetailsScreen
    //   ],
    //   transition: Transition.rightToLeft, // Another example transition
    // ),
  ];
}
