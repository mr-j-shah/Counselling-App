import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppAssets.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/SideMenuTiles.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Sidemenu extends StatelessWidget {
  Sidemenu({super.key});
  final Homecontroller _homecontroller = Get.find<Homecontroller>();
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
            Row(
              children: [
                CircleAvatar(
                  radius: Dimensions.radius(22),
                  child: Icon(Icons.person_outline),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: Dimensions.width(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jinay Shah",
                        style: TextStyle(
                          fontSize: Dimensions.font(16),
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "+91 9978530638",
                        style: TextStyle(
                          fontSize: Dimensions.font(12),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsGeometry.only(right: Dimensions.width(20)),
                  child: GestureDetector(
                    onTap: _homecontroller.toggleMenu,
                    child: SvgPicture.asset(
                      Appassets.closeIconRed,
                      height: Dimensions.height(30),
                      width: Dimensions.width(30),
                      fit: BoxFit.contain,
                      placeholderBuilder: (ctx) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height(50)),
            SizedBox(
              width: Dimensions.baseWidth * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SideMenuTile(
                    index: 1,
                    title: "My Chats",
                    leadingIcon: Icon(Icons.chat,color: white,),
                  ),
                  SideMenuTile(
                    index: 2,
                    title: "Payments",
                    leadingIcon: Icon(Icons.payment,color: white,),
                  ),
                  SideMenuTile(
                    index: 3,
                    title: "Privacy & Policy",
                    leadingIcon: Icon(Icons.policy,color: white,),
                    onTap: (){
                      _homecontroller.navigateToPrivacyPolicy();
                    },
                  ),
                  SideMenuTile(
                    index: 4,
                    title: "Help Center",
                    leadingIcon: Icon(Icons.help_center,color: white,),
                  ),
                  SideMenuTile(
                    index: 5,
                    title: "Settings",
                    leadingIcon: Icon(Icons.settings,color: white,),
                  ),
                ],
              ),
            ),

            Spacer(),
            ListTile(
              title: Text("Log Out", style: TextStyle(color: white)),
              leading: Icon(Icons.logout_outlined),
              iconColor: Colors.white,
              onTap: _homecontroller.logOutUser,
            ),
          ],
        ),
      ),
    );
  }
}
