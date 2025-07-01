import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_counselling/app/ApplicationBinding/AppBinding.dart';
import 'package:project_counselling/app/routers/app_routes.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void main() async {
  // await AppPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Dimensions.init(context); 
        });
        return child!;
      },
      debugShowCheckedModeBanner: false,
      title: 'GetX Router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitialBinding(),
      getPages: AppRoutes.routes,
      initialRoute: Routes.SPLASH_SCREEN,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Center(child: Text('404 Page Not Found')),
      ),
    );
  }
}
