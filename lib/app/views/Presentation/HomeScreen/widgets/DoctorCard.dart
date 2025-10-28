import 'package:flutter/material.dart';
import 'package:project_counselling/app/data/models/Doctor.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(16)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.width(8),
        vertical: Dimensions.height(4),
      ),
      child: SizedBox(
        width: Dimensions.width(160),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.padding(12)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  doctor.canPrescribeMedicine?Icon(Icons.medical_information, color: Colors.redAccent, size: Dimensions.font(20)):SizedBox(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: Dimensions.font(20)),
                      SizedBox(width: Dimensions.width(4)),
                      AppText(
                        text: doctor.rating.toString(),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height(12)),
              CircleAvatar(
                radius: Dimensions.radius(40),
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
              SizedBox(height: Dimensions.height(12)),
              AppText(
                text: doctor.name,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font(16),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: Dimensions.height(4)),
              AppText(
                text: "\$${doctor.hourRate.toStringAsFixed(2)}/ hours",
                color: Colors.green,
                fontSize: Dimensions.font(14),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
