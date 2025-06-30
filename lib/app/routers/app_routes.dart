import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/bindings/HomeBinding.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/IntroScreen.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/bindings/IntroBindings.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/LoginScreen.dart';
import 'package:project_counselling/app/views/Presentation/SplashScreen/SplashScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/binding/SpeechBindings.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/HomeScreen.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/SpeechScreen.dart';
import 'package:project_counselling/app/views/Presentation/ChatScreen/UserChatScreen.dart';

abstract class Routes {
  static const String HOME = '/home';
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String SPEECH_TEXT = '/speech-text';
  static const String USER_CHAT = '/user-chat';
  static const String INTRO_SCREEN = '/intro-screen';
  static const String LOGIN_SCREEN = '/login-screen';
}

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Homescreen(),
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
      name: Routes.LOGIN_SCREEN,
      page: () => Loginscreen(),
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
