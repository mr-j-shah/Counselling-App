import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ChatHistoryShimmer extends StatelessWidget {
  const ChatHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Display several shimmer items
      padding: EdgeInsets.all(Dimensions.padding(16)),
      itemBuilder: (context, index) {
        return Shimmer(
          duration: const Duration(seconds: 3),
          interval: const Duration(milliseconds: 500),
          color: Colors.white,
          colorOpacity: 0.3,
          enabled: true,
          direction: const ShimmerDirection.fromLeftToRight(),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: Dimensions.height(8)),
            elevation: 3,
            shadowColor: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius(12)),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.padding(16)),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.width(60),
                    height: Dimensions.height(60),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                    ),
                  ),
                  SizedBox(width: Dimensions.width(16)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: Dimensions.height(8)),
                        Container(
                          height: 16,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.width(10)),
                  Icon(Icons.more_vert, color: Colors.grey.shade300),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
