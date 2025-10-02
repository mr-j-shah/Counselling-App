import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart'; // Added
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart'; // Added
import 'package:project_counselling/app/views/Utils/Dimensions.dart'; // Added
// import 'package:project_counselling/app/constants/AppString.dart'; // If title comes from AppString

class SpeechScreen extends StatelessWidget {
  final controller = Get.put(SpeechController());

  SpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); // Initialize Dimensions
    final SpeechController speechController = Get.find<SpeechController>(); // More explicit way to find controller if needed

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                title: "Live Talking", // Or AppString.liveTalking if you add it
                suffixAction: IconButton(
                  icon: const Icon(Icons.chat_bubble),
                  tooltip: 'Conversation',
                  color: Colors.black54, // Match default icon color or make it a constant
                  onPressed: speechController.navigateToChat,
                ),
                // onLeadingClick: () => Get.back(), // Default behavior of CustomAppBar back button
              ),
              Expanded(
                child: Center(
                  child: Obx(() {
                    if (speechController.speechTimedOut.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.hearing_disabled, size: 80, color: Colors.red),
                          SizedBox(height: Dimensions.height(10)),
                          Text(
                            "Listening stopped due to silence.",
                            style: TextStyle(fontSize: Dimensions.font(18)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Dimensions.height(20)),
                          ElevatedButton.icon(
                            onPressed: speechController.retryListeningManually,
                            icon: Icon(Icons.refresh),
                            label: Text("Restart Listening"),
                          ),
                        ],
                      );
                    } else if (speechController.isSpeaking.value) {
                      return Lottie.asset('assets/lottie/speaking_man.json');
                    } else if (speechController.isThinking.value) {
                      return Lottie.asset('assets/lottie/thinking_man.json');
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          speechController.isListening.value
                              ? Icons.hearing
                              : Icons.pause_circle,
                          size: 80,
                          color: speechController.isListening.value
                              ? Colors.green
                              : Colors.grey,
                        ),
                        SizedBox(height: Dimensions.height(20)),
                        Text(
                          speechController.isListening.value ? _buildLiveText() : "Idle",
                          style: TextStyle(fontSize: Dimensions.font(22)),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Animated dots for listening message
  String _buildLiveText() {
    final time = DateTime.now().second % 4;
    return "Listening${"." * time}";
  }
}
