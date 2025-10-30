import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/Presentation/AvatarDetail/controller/AvatarDetailController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/SlideToBegin.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class AvatarDetailScreen extends GetView<AvatarDetailController> {
  const AvatarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildAvatarBackground(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarBackground() {
    return Container(
      height: Dimensions.height(400),
      width: double.infinity,
      child: Image.network(
        controller.avatar.imageUrl,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 350),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: ""),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height(500),
              width: double.infinity,
              padding: EdgeInsets.all(Dimensions.padding(24)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius(30))),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 5, blurRadius: 15)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatarHeader(),
                  SizedBox(height: Dimensions.height(20)),
                  AppText(
                    text: controller.avatar.description,
                    fontSize: Dimensions.font(16),
                    color: Colors.grey.shade600,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: SlideToBegin(
                      text: "Start Chat",
                      onSlideCompleted: () {
                        Get.toNamed(Routes.SPEECH_TEXT, arguments: controller.avatar);
                      },
                      width: MediaQuery.of(context).size.width*0.8,
                    ),
                  ),
                  SizedBox(height: Dimensions.height(20)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: controller.avatar.name,
                fontSize: Dimensions.font(28),
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: Dimensions.height(4)),
              AppText(
                text: controller.avatar.occupation,
                fontSize: Dimensions.font(18),
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < controller.avatar.rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: Dimensions.font(24),
            );
          }),
        ),
      ],
    );
  }
}
