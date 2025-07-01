import 'package:flutter/widgets.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Bottomsheethandle extends StatelessWidget {
  const Bottomsheethandle({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Center(
      child: Container(
        width: Dimensions.width(130),
        height: Dimensions.height(5),
        margin: EdgeInsets.only(bottom: Dimensions.height(55)),
        decoration: BoxDecoration(
          color: bottomSheetHandle,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
