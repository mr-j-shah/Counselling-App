import 'package:flutter/material.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class AvatarCard extends StatelessWidget {
  final Avatar avatar;

  const AvatarCard({super.key, required this.avatar});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Card(
      elevation: 4,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(16)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.width(8),
        vertical: Dimensions.height(4),
      ),
      child: SizedBox(
        width: Dimensions.width(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Dimensions.radius(16)),
                ),
                child: Image.network(
                  avatar.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.padding(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: avatar.name,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font(16),
                      align: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Dimensions.height(4)),
                    AppText(
                      text: avatar.occupation,
                      color: Colors.grey.shade600,
                      fontSize: Dimensions.font(12),
                      align: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Dimensions.height(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: Dimensions.font(18),
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
