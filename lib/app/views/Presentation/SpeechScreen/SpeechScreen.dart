import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';

class SpeechScreen extends StatelessWidget {
  final controller = Get.put(SpeechController());

  SpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Talking"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chat_bubble),
            tooltip: 'Conversation',
            onPressed: controller.navigateToChat,
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (controller.speechTimedOut.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hearing_disabled, size: 80, color: Colors.red),
                SizedBox(height: 10),
                Text(
                  "Listening stopped due to silence.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: controller.retryListeningManually,
                  icon: Icon(Icons.refresh),
                  label: Text("Restart Listening"),
                ),
              ],
            );
          } else if (controller.isSpeaking.value) {
            return Lottie.asset('assets/lottie/speaking_man.json');
          } else if (controller.isThinking.value) {
            return Lottie.asset('assets/lottie/thinking_man.json');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                controller.isListening.value
                    ? Icons.hearing
                    : Icons.pause_circle,
                size: 80,
                color: controller.isListening.value
                    ? Colors.green
                    : Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
                controller.isListening.value ? _buildLiveText() : "Idle",
                style: TextStyle(fontSize: 22),
              ),
            ],
          );
        }),
      ),
    );
  }

  // Animated dots for listening message
  String _buildLiveText() {
    final time = DateTime.now().second % 4;
    return "Listening${"." * time}";
  }
}
