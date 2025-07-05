import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/widgets/PersonalinfroTiles.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: CustomAppbar(title: "Profile", titleColor: white),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Dimensions.radius(30)),
                        bottomRight: Radius.circular(Dimensions.radius(30)),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: Dimensions.height(5),
                      bottom: Dimensions.height(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.height(10)),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: Dimensions.padding(20),
                          ),
                          child: AppText(
                            text: "Set up your profile",
                            fontSize: Dimensions.font(18),
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: Dimensions.height(5)),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: Dimensions.padding(20),
                          ),
                          child: AppText(
                            text:
                                "Update your profile to connect your doctor with better impression.",
                            style: TextStyle(
                              fontSize: Dimensions.font(14),
                              color: Colors.white,
                            ),
                            align: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: Dimensions.height(15)),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: Dimensions.radius(65),
                              backgroundImage: NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png",
                              ),
                            ),
                            CircleAvatar(
                              radius: Dimensions.radius(15),
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.camera_alt,
                                size: Dimensions.height(15),
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Personal Info Section
                  Padding(
                    padding: EdgeInsets.all(Dimensions.padding(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Personal information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font(18),
                          ),
                        ),
                        SizedBox(height: Dimensions.height(16)),
                        Personalinfrotiles(
                          label: "Name",
                          value: "Abdullah Mamun",
                        ),
                        Personalinfrotiles(
                          label: "Contact Number",
                          value: "+8801800000000",
                        ),
                        Personalinfrotiles(
                          label: "Date of birth",
                          value: "DD MM YYYY",
                        ),
                        Personalinfrotiles(
                          label: "Location",
                          value: "Add Details",
                          showEdit: false,
                        ),
                        Center(
                          child: PrimaryButton(
                            text: "Continue",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
