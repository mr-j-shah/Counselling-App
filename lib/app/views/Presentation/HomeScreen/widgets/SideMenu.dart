import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: Dimensions.radius(30),
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
                  ListTile(
                    title: Text("My Chats",style: TextStyle(color: white),),
                    leading: Icon(Icons.chat),
                    iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Payments",style: TextStyle(color: white),),
                    leading: Icon(Icons.payment),
                    iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Privacy & Policy",style: TextStyle(color: white),),
                    leading: Icon(Icons.policy),
                    iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Help Center",style: TextStyle(color: white),),
                    leading: Icon(Icons.help_center),
                    iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    title: Text("Settings",style: TextStyle(color: white),),
                    leading: Icon(Icons.settings),
                    iconColor: Colors.white,
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),

            Spacer(),
            ListTile(
              title: Text("Log Out",style: TextStyle(color: white),),
              leading: Icon(Icons.logout_outlined),
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
