import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppAssets.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/SocialButton.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/controller/AuthContoller.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Socialbuttonsrow extends StatelessWidget {
  Socialbuttonsrow({super.key});
  final Authcontroller _authcontroller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: Dimensions.padding(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialButton(
            Appstring.google,
            // Image.asset(Appassets.socialButtonGoogle),
            SvgPicture.asset(
              Appassets.socialButtonGoogle,
              height: Dimensions.height(18),
              width: Dimensions.width(18),
              fit: BoxFit.contain,
              placeholderBuilder: (ctx) =>
                  Center(child: CircularProgressIndicator()),
            ),
            () {
              _authcontroller.loginWithGoogle();
            },
          ),
          SizedBox(width: Dimensions.width(15)),
          socialButton(
            Appstring.facebook,
            SvgPicture.asset(
              Appassets.socialButtonFacebook,
              height: Dimensions.height(18),
              width: Dimensions.width(18),
              fit: BoxFit.contain,
              placeholderBuilder: (ctx) =>
                  Center(child: CircularProgressIndicator()),
            ),
            () {},
          ),
        ],
      ),
    );
  }
}
