import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/models/AmbientSound.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/AmbientMixerScreen/controller/AmbientAIController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';

class AmbientMixerScreen extends StatefulWidget {
  const AmbientMixerScreen({super.key});

  @override
  State<AmbientMixerScreen> createState() => _AmbientMixerScreenState();
}

class _AmbientMixerScreenState extends State<AmbientMixerScreen> {
  final AmbientAIController controller = Get.put(AmbientAIController());
  String? _selectedSoundId; // State to manage which sound's detailed card is open

  // Define distinct colors for each sound
  final Map<String, Color> _soundColors = {
    'rain': Colors.blue.shade400,
    'ocean': Colors.indigo.shade400,
    'wind': Colors.grey.shade600,
    'fire': Colors.orange.shade700,
    'piano': Colors.purple.shade400,
  };

  @override
  void initState() {
    super.initState();
    // Set the first sound as selected by default
    if (controller.availableSounds.isNotEmpty) {
      _selectedSoundId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomAppbar(title: "Ambient Sound Mixer"),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(Dimensions.padding(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // AI Generation Button
                          PrimaryButton(
                            text: "✨ Create My Calm Scene with AI",
                            onPressed: () => _showAIGenerationBottomSheet(context, controller),
                            width: double.infinity,
                          ),
                          SizedBox(height: Dimensions.height(24)),

                          // Current Scene Display
                          _buildCurrentSceneDisplay(controller),
                          SizedBox(height: Dimensions.height(24)),

                          // Modernized Sound Mixer Scroller
                          const AppText(
                            text: "🪷 My Current Mix",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: Dimensions.height(16)),
                          _buildModernSoundMixer(controller),
                          SizedBox(height: Dimensions.height(24)),

                          // Redesigned Control Buttons
                          _buildRedesignedControls(controller),
                          SizedBox(height: Dimensions.height(24)),

                          // Saved Scenes
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
              // Loading Overlay - Directly embed the content of _buildLoadingOverlay()
              Obx(() => controller.isLoading.value
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: primaryColor),
                              SizedBox(height: Dimensions.height(16)),
                              AppText(
                                text: "Generating your calm scene...",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }

  // --- New/Updated Widgets ---

  void _showAIGenerationBottomSheet(BuildContext context, AmbientAIController controller) {
    Get.bottomSheet(
      _AIGenerationBottomSheetContent(controller: controller),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildCurrentSceneDisplay(AmbientAIController controller) {
    return Obx(() {
      final scene = controller.currentScene.value;
      if (scene == null) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: scene.title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          SizedBox(height: Dimensions.height(8)),
          AppText(
            text: '"${scene.affirmation}"',
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
          SizedBox(height: Dimensions.height(16)),
          Align(
            alignment: Alignment.centerRight,
            child: AppText(
              text: 'Mood: ${scene.moodLabel}',
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildModernSoundMixer(AmbientAIController controller) {
    return Column(
      children: [
        // Horizontal list of sound icons with rings
        Obx(() {
          final sounds = controller.availableSounds;
          final firstRow = sounds.take(3).toList();
          final secondRow = sounds.skip(3).take(2).toList();

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: firstRow.map((sound) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width(8)),
                    child: _buildSoundRingIcon(sound, controller),
                  );
                }).toList(),
              ),
              if (secondRow.isNotEmpty)
                SizedBox(height: Dimensions.height(16)), // Space between rows
              if (secondRow.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: secondRow.map((sound) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width(15)),
                      child: _buildSoundRingIcon(sound, controller),
                    );
                  }).toList(),
                ),
            ],
          );
        }),
        SizedBox(height: Dimensions.height(24)),
        // Detailed card with slider for the selected sound
        if(_selectedSoundId != null)
          Obx(() {
            if (controller.availableSounds
                .any((s) => s.id == _selectedSoundId)) {
              final selectedSound = controller.availableSounds
                  .firstWhere((s) => s.id == _selectedSoundId);
              return _buildDetailedSoundCard(selectedSound, controller);
            } else {
              return const SizedBox.shrink();
            }
          }),
        if(_selectedSoundId == null) const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildSoundRingIcon(AmbientSound sound, AmbientAIController controller) {
    final Color accentColor = _soundColors[sound.id] ?? primaryColor; // Fallback to primaryColor
    final double ringSize = Dimensions.width(100);
    final double borderWidth = Dimensions.width(10);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSoundId = sound.id;
        });
      },
      child: Obx(() {
        final currentGain = controller.soundGains[sound.id] ?? 0.0;
        return Container(
          width: ringSize,
          height: ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: accentColor.withOpacity(0.2), // Inactive part of the ring
              width: borderWidth,
            ),
            boxShadow: [ // subtle shadow for selected state
              if (_selectedSoundId == sound.id)
                BoxShadow(
                  color: accentColor.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
            ],
          ),
          child: Stack( // Use Stack to layer emoji and progress indicator
            alignment: Alignment.center,
            children: [
              // Emoji Text
              Center(
                child: AppText(
                  text: sound.name.split(' ').last, // Extract emoji (e.g., "🌧️")
                  fontSize: 30,
                ),
              ),
              // CircularProgressIndicator for gain visualization
              if (currentGain > 0.0)
                SizedBox(
                  width: ringSize,
                  height: ringSize,
                  child: CircularProgressIndicator(
                    value: currentGain, // Value from 0.0 to 1.0
                    strokeWidth: borderWidth,
                    valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                    backgroundColor: Colors.transparent, // Background of the indicator path
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDetailedSoundCard(AmbientSound sound, AmbientAIController controller) {
    final Color accentColor = _soundColors[sound.id] ?? primaryColor;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(20))),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: sound.name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      _selectedSoundId = null; // Close the detailed card
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: Dimensions.height(16)),
            Obx(() => Slider(
                  value: controller.soundGains[sound.id] ?? 0.0,
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  label: (controller.soundGains[sound.id] ?? 0.0).toStringAsFixed(1),
                  activeColor: accentColor,
                  inactiveColor: accentColor.withOpacity(0.3),
                  onChanged: (value) => controller.updateGain(sound.id, value),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildRedesignedControls(AmbientAIController controller) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildControlCircleButton(
              icon: controller.isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
              label: controller.isPlaying.value ? "Pause" : "Play",
              color: primaryColor,
              onTap: () => controller.togglePlayback(),
            ),
            _buildControlCircleButton(
              icon: Icons.save_alt_rounded,
              label: "Save",
              color: Colors.blueAccent,
              onTap: () => controller.saveCurrentScene(),
            ),
            _buildControlCircleButton(
              icon: Icons.refresh_rounded,
              label: "Reset",
              color: Colors.redAccent,
              onTap: () => controller.resetMix(),
            ),
          ],
        ));
  }

  Widget _buildControlCircleButton({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Dimensions.radius(30)),
          child: Container(
            padding: EdgeInsets.all(Dimensions.padding(12)),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 1.5),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        SizedBox(height: Dimensions.height(8)),
        AppText(text: label, fontSize: 12, color: color, fontWeight: FontWeight.w500),
      ],
    );
  }

  Widget _buildSavedScenes(AmbientAIController controller) {
    return Obx(() {
      if (controller.savedScenes.isEmpty) {
        return Center(child: AppText(text: "No saved scenes yet.", color: Colors.grey.shade500));
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.savedScenes.length,
        itemBuilder: (context, index) {
          final scene = controller.savedScenes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(12))),
            child: ListTile(
              title: AppText(text: scene.title, fontWeight: FontWeight.bold),
              subtitle: AppText(
                text: 'Mood: ${scene.moodLabel} - ${scene.sounds.map((s) => s.name).join(' + ')}',
                color: Colors.grey,
                fontSize: 12,
              ),
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

// AI Generation Bottom Sheet Content
class _AIGenerationBottomSheetContent extends StatelessWidget {
  final AmbientAIController controller;

  const _AIGenerationBottomSheetContent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding(20)),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bottomsheethandle(),
            SizedBox(height: Dimensions.height(16)),
            const AppText(
              text: "Tell AI Your Mood",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "Move the slider to tell Aura Mind how you're feeling right now.",
              color: Colors.grey.shade600,
            ),
            SizedBox(height: Dimensions.height(24)),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(15))),
              child: Padding(
                padding: EdgeInsets.all(Dimensions.padding(16)),
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Mood Score: ${controller.mood.value.round()}/10",
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        Slider(
                          value: controller.mood.value,
                          min: 1,
                          max: 10,
                          divisions: 9,
                          label: controller.mood.value.round().toString(),
                          activeColor: primaryColor,
                          onChanged: (value) => controller.mood.value = value,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Anxious", fontSize: 12, color: Colors.redAccent),
                            AppText(text: "Calm", fontSize: 12, color: Colors.greenAccent),
                          ],
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(height: Dimensions.height(32)),
            PrimaryButton(
              text: "✨ Generate My Scene",
              width: double.infinity,
              onPressed: () => controller.generateScene(),
            ),
          ],
        ),
      ),
    );
  }
}
