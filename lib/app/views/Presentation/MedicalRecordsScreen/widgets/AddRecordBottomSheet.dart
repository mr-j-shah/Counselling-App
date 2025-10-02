import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';

import '../../../../Constants/AppAssets.dart';

class AddRecordBottomSheet extends StatelessWidget {
  final VoidCallback onTakePhoto;
  final VoidCallback onUploadFromGallery;
  final VoidCallback onUploadFiles;

  const AddRecordBottomSheet({
    super.key,
    required this.onTakePhoto,
    required this.onUploadFromGallery,
    required this.onUploadFiles,
  });

  Widget _buildListTile(BuildContext context, Widget icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: icon, // Icon is now a Widget, allowing SvgPicture or Icon
      title: Text(title, style: TextStyle(fontSize: Dimensions.font(16), fontWeight: FontWeight.w500)),
      onTap: () {
        Get.back(); // Close the bottom sheet first
        onTap();    // Then execute the action
      },
      contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width(20), vertical: Dimensions.height(4)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final textTheme = Theme.of(context).textTheme;

    // Define icon widgets - adjust asset paths and colors as needed
    final Widget cameraIcon = SvgPicture.asset(Appassets.cameraIcon,  width: Dimensions.font(20),);
    final Widget galleryIcon = SvgPicture.asset(Appassets.galleryIcon, width: Dimensions.font(20),);
    final Widget fileIcon = SvgPicture.asset(Appassets.fileIcon, width: Dimensions.font(20),);

    return Container(
      padding: EdgeInsets.only(top: Dimensions.height(12), bottom: Dimensions.height(20) + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius(30)), 
          topRight: Radius.circular(Dimensions.radius(30))
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // Center the handle
        children: [
          Bottomsheethandle(), // Handle added
          SizedBox(height: Dimensions.height(12)), // Space after handle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width(20)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold), text: "Add a record",
              ),
            ),
          ),
          SizedBox(height: Dimensions.height(16)), // Increased space before list tiles
          _buildListTile(context, cameraIcon, "Take a photo", onTakePhoto),
          _buildListTile(context, galleryIcon, "Upload from gallery", onUploadFromGallery),
          _buildListTile(context, fileIcon, "Upload files", onUploadFiles),
        ],
      ),
    );
  }
}
