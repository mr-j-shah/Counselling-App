import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppAssets.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/SideMenuController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/model/SideMenu.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/SideMenuTiles.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Sidemenu extends StatelessWidget {
  Sidemenu({super.key});
  final Sidemenucontroller _sidemenucontroller = Get.find<Sidemenucontroller>();
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6F7FA1), Color(0xFF536184)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top * 2,
          left: Dimensions.width(10),
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _sidemenucontroller.navigateToProfileScreen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.padding(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: Dimensions.radius(22),
                      child: Icon(Icons.person_outline),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: Dimensions.width(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: _sidemenucontroller.getUserName(),
                            style: TextStyle(
                              fontSize: Dimensions.font(16),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          AppText(
                            text: _sidemenucontroller.getEmail(),
                            style: TextStyle(
                              fontSize: Dimensions.font(12),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height(50)),
            SizedBox(
              width: Dimensions.baseWidth * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (SidemenuModel sideMenutileData
                      in _sidemenucontroller.sideMenuItems) ...[
                    SideMenuTile(
                      index: sideMenutileData.index,
                      title: sideMenutileData.title,
                      leadingIcon: SvgPicture.asset(sideMenutileData.icon),
                      onTap: () {
                        _sidemenucontroller.sideMenuClick(
                          sideMenutileData.index,
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
            Spacer(),
            ListTile(
              title: AppText(
                text: Appstring.logOut,
                style: TextStyle(color: white),
                fontSize: Dimensions.font(16),
                fontWeight: FontWeight.w500,
              ),
              leading: SvgPicture.asset(Appassets.logoutIcon),
              iconColor: Colors.white,
              onTap: _sidemenucontroller.logOutUser,
            ),
          ],
        ),
      ),
    );
  }
}
