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
    return Obx(
          ()=>Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: _homecontroller.appBarOpacity.value?Dimensions.height(200):0,
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
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity:_homecontroller.appBarOpacity.value?1:0,
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
                                text: "How can I help you?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font(24),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: _homecontroller.toggleMenu,
                          child: CircleAvatar(
                            radius: Dimensions.radius(30),
                            child: Icon(Icons.person, color: primaryColor,size: Dimensions.radius(30),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Positioned Search Box
              Positioned(
                top: Dimensions.height(170),
                left: Dimensions.width(20),
                right: Dimensions.width(20),
                child: AnimatedOpacity(
                  opacity:_homecontroller.appBarOpacity.value?1:0,
                  duration: Duration(milliseconds: 500),
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
              ),
            ],
          ),
          SizedBox(height: Dimensions.height(10)),
        ],
      ),
    );
  }
}