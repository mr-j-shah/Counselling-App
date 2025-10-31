import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/controller/ProfileScreenController.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/widgets/PersonalInfoEditType.dart';
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
            EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Obx(() {
                                final profileImageUrl =
                                    controller.user.value?.profileImage;
                                return CircleAvatar(
                                  radius: Dimensions.radius(65),
                                  backgroundColor: Colors.grey.shade200,
                                  backgroundImage: (profileImageUrl != null &&
                                          profileImageUrl.isNotEmpty)
                                      ? NetworkImage(profileImageUrl)
                                      : null,
                                  child: (profileImageUrl == null ||
                                          profileImageUrl.isEmpty)
                                      ? Icon(
                                          Icons.person,
                                          size: Dimensions.radius(80),
                                          color: Colors.grey.shade400,
                                        )
                                      : null,
                                );
                              }),
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
                          SizedBox(height: Dimensions.height(15)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.padding(20),
                            ),
                            child: AppText(
                              text: controller.user.value!.name,
                              fontSize: Dimensions.font(22),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.padding(20),
                            ),
                            child: AppText(
                              text: controller.user.value!.email,
                              style: TextStyle(
                                fontSize: Dimensions.font(18),
                                color: Colors.white,
                              ),
                              align: TextAlign.center,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: Dimensions.height(15)),
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
                            controller.user.value == null) {
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
                              label: Appstring.contactNumber,
                              value: controller.user.value!.contactNum ?? "Add Details",
                              editType: PersonalInfoEditType.phone,
                              onValueChanged: (newValue) {
                                controller.updateContactNumber(newValue);
                              },
                            ),
                            Personalinfrotiles(
                              label: Appstring.dateOfBirth,
                              value: controller.user.value!.dob ?? "DD MM YYYY",
                              editType: PersonalInfoEditType.date,
                              onValueChanged: (newValue) {
                                controller.updateDateOfBirth(newValue);
                              },
                            ),
                            Personalinfrotiles(
                              label: Appstring.location,
                              value: controller.user.value!.location ?? "Add Details",
                              editType: PersonalInfoEditType.text,
                              onValueChanged: (newValue) {
                                controller.updateLocation(newValue);
                              },
                            ),
                            SizedBox(height: Dimensions.height(20)),
                            if (controller.isProfileDirty.value)
                              Center(
                                child: PrimaryButton(
                                  text: "Save",
                                  onPressed: controller.saveUserProfile,
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
