import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Homeappbar extends StatelessWidget {
  Homeappbar({super.key});
  final Homecontroller _homecontroller = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Dimensions.height(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius(20)),
                  bottomRight: Radius.circular(Dimensions.radius(20)),
                ),
                gradient: LinearGradient(
                  colors: [homeAppBarGradient1, primaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.padding(20),
                  left: Dimensions.padding(16),
                  right: Dimensions.padding(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.baseWidth * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Hi, ${_homecontroller.getUserName()}!",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 4),
                          AppText(
                            text: "We are here to Help!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.font(24),
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _homecontroller.toggleMenu,
                      child: CircleAvatar(
                        radius: Dimensions.radius(30),
                        backgroundImage: NetworkImage(
                           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1wz0j6iNcsEAAUlxR1zS7jElJ8RnGj-74_w&s",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned Search Box
            Positioned(
              bottom: -Dimensions.height(30),
              left: Dimensions.width(20),
              right: Dimensions.width(20),
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(Dimensions.radius(16)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.close),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius(16),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height(10)),
      ],
    );
  }
}
