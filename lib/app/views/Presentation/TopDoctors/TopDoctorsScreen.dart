import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/DoctorCard.dart';
import 'package:project_counselling/app/views/Presentation/TopDoctors/controller/TopDoctorsController.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class TopDoctorsScreen extends GetView<TopDoctorsController> {
  const TopDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Top Doctors"),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.width(16),
                    mainAxisSpacing: Dimensions.height(16),
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.doctorList.length,
                  itemBuilder: (context, index) {
                    return DoctorCard(doctor: controller.doctorList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
