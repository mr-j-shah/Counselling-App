import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/AmbientMixerScreen/controller/AmbientAIController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class AmbientMixerScreen extends StatelessWidget {
  const AmbientMixerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AmbientAIController controller = Get.put(AmbientAIController());

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Ambient Sound Mixer"),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMoodSelector(controller),
                      SizedBox(height: Dimensions.height(24)),
                      PrimaryButton(
                        text: "✨ Create My Calm Scene with AI",
                        onPressed: () => controller.generateScene(),
                        width: double.infinity,
                      ),
                      SizedBox(height: Dimensions.height(24)),
                      const AppText(
                        text: "🪷 My Current Mix",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: Dimensions.height(16)),
                      _buildSoundList(controller),
                      SizedBox(height: Dimensions.height(24)),
                      _buildControls(controller),
                      SizedBox(height: Dimensions.height(24)),
                      const AppText(
                        text: "Saved Scenes ▼",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: Dimensions.height(16)),
                      _buildSavedScenes(controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodSelector(AmbientAIController controller) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(15))),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(text: "😌 How do you feel today?", fontWeight: FontWeight.bold),
            Obx(() => Slider(
                  value: controller.mood.value,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: controller.mood.value.round().toString(),
                  activeColor: primaryColor,
                  onChanged: (value) => controller.mood.value = value,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSoundList(AmbientAIController controller) {
    return Obx(() => Column(
          children: controller.availableSounds.map((sound) {
            return _buildSoundSlider(sound.name, sound.id, controller);
          }).toList(),
        ));
  }

  Widget _buildSoundSlider(String title, String soundId, AmbientAIController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          AppText(text: title),
          Expanded(
            child: Obx(() => Slider(
                  value: controller.soundGains[soundId] ?? 0.0,
                  onChanged: (value) => controller.updateGain(soundId, value),
                  activeColor: primaryColor,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildControls(AmbientAIController controller) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(controller.isPlaying.value ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded, color: primaryColor, size: 40),
              onPressed: () => controller.togglePlayback(),
            ),
            IconButton(
              icon: const Icon(Icons.save_alt_rounded, color: Colors.blueAccent, size: 40),
              onPressed: () => controller.saveCurrentScene(),
            ),
            IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.grey, size: 40),
              onPressed: () => controller.resetMix(),
            ),
          ],
        ));
  }

  Widget _buildSavedScenes(AmbientAIController controller) {
    return Obx(() {
      if (controller.savedScenes.isEmpty) {
        return const Center(child: AppText(text: "No saved scenes yet.", color: Colors.grey));
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.savedScenes.length,
        itemBuilder: (context, index) {
          final scene = controller.savedScenes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: AppText(text: scene.title, fontWeight: FontWeight.bold),
              subtitle: AppText(text: scene.sounds.map((s) => s.name).join(' + '), color: Colors.grey),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () => controller.deleteScene(scene.id),
              ),
              onTap: () => controller.loadScene(scene),
            ),
          );
        },
      );
    });
  }
}
