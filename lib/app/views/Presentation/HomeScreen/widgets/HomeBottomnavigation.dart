import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Homebottomnavigation extends StatelessWidget {
  const Homebottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Card(
      color: Colors.white,
      elevation: 20,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.all(0),
      child: Container(
        height: Dimensions.height(74),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.book_outlined),
            Icon(Icons.chat),
          ],
        ),
      ),
    );
  }
}
