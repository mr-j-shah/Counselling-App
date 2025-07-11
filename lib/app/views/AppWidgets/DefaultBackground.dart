import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

class Defaultbackground extends StatelessWidget {
  final Widget child;
  const Defaultbackground({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Base white background
      child: Stack(
        children: [
          // Top-left green circle
          Positioned(
            top: -MediaQuery.of(context).size.width,
            left: -MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [lighterPrimary, white38],
                  radius: 0.5,
                ),
              ),
            ),
          ),

          // Bottom-right green circle
          Positioned(
            bottom: -MediaQuery.of(context).size.width,
            right: -MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [lighterPrimary, white38],
                  radius: 0.5,
                ),
              ),
            ),
          ),

          // add full screen widget here
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
