import 'package:flutter/material.dart';
import 'package:project_counselling/app/Constants/AppAssets.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/SocialButton.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Socialbuttonsrow extends StatelessWidget {
  const Socialbuttonsrow({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: Dimensions.padding(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialButton(
            Appstring.google,
            Image.asset(Appassets.socialButtonGoogle),
          ),
          SizedBox(width: Dimensions.width(15)),
          socialButton(
            Appstring.facebook,
            Image.asset(Appassets.socialButtonFacebook),
          ),
        ],
      ),
    );
  }
}
