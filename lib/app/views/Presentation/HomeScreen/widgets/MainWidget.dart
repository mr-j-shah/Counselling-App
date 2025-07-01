import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';

class Mainwidget extends StatelessWidget {

  final Homecontroller _homecontroller = Get.find<Homecontroller>();
  Mainwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Counselling Application"),
            leading: IconButton(
              onPressed: _homecontroller.toggleMenu,
              icon: Icon(Icons.menu),
            ),
          ),
          body: Center(
            child: SizedBox()
            // Card(
            //   elevation: 6,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   margin: const EdgeInsets.all(16),
            //   child: Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // Agent image
            //         Lottie.asset('assets/lottie/agent.json'),
            //         const SizedBox(height: 20),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             ElevatedButton.icon(
            //               onPressed: _homecontroller.navigateToCounsellingHindi,
            //               icon: const Icon(Icons.language),
            //               label: const Text("हिन्दी"),
            //               style: ElevatedButton.styleFrom(
            //                 backgroundColor: Colors.orangeAccent,
            //                 foregroundColor: Colors.white,
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(12),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(width: 12),
            //             ElevatedButton.icon(
            //               onPressed:
            //                   _homecontroller.navigateToCounsellingEnglish,
            //               icon: const Icon(Icons.language),
            //               label: const Text("English"),
            //               style: ElevatedButton.styleFrom(
            //                 backgroundColor: Colors.blueAccent,
            //                 foregroundColor: Colors.white,
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(12),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        )
;
  }
}