import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/controller/ProfileScreenController.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/widgets/PersonalinfroTiles.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.find<Profilescreencontroller>();

  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding:
            EdgeInsetsGeometry.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: CustomAppbar(title: Appstring.profileTitle, titleColor: white),
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
                              text: Appstring.setUpYourProfile,
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
                              text: Appstring.updateProfileTitle,
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
                      child: Obx(() {
                        if (!controller.isUserFetched.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (controller.isUserFetchedError.value ||
                            controller.user == null) {
                          return Center(child: Text("Failed to load user data."));
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: Appstring.personalInfo,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font(18),
                              ),
                            ),
                            SizedBox(height: Dimensions.height(16)),
                            Personalinfrotiles(
                              label: Appstring.name,
                              value: controller.user!.name,
                              showEdit: false,
                            ),
                            Personalinfrotiles(
                              label: Appstring.email,
                              value: controller.user!.email,
                              showEdit: false,
                            ),
                            Personalinfrotiles(
                              label: Appstring.contactNumber,
                              value: controller.user!.contactNum ?? "Add Details",
                              showEdit: true,
                              onEditPressed: (){},
                            ),
                            Personalinfrotiles(
                              label: Appstring.dateOfBirth,
                              value: controller.user!.dob ?? "DD MM YYYY",
                              showEdit: true,
                              onEditPressed: (){},
                            ),
                            Personalinfrotiles(
                              label: Appstring.location,
                              value: controller.user!.location ?? "Add Details",
                              showEdit: true,
                              onEditPressed: (){},
                            ),
                            Center(
                              child: PrimaryButton(
                                text: Appstring.continueTxt,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
