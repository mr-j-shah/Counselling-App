import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project_counselling/app/models/AmbientScene.dart';
import 'package:project_counselling/app/models/AmbientSound.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmbientAIController extends GetxController {
  // UI State
  final RxBool isLoading = false.obs;
  final RxBool isPlaying = false.obs;
  final RxDouble mood = 5.0.obs;
  final RxMap<String, double> soundGains = <String, double>{}.obs;

  // Data
  final RxList<AmbientSound> availableSounds = <AmbientSound>[].obs;
  final RxList<AmbientScene> savedScenes = <AmbientScene>[].obs;
  final Rx<AmbientScene?> currentScene = Rx<AmbientScene?>(null);

  // Audio Players
  final Map<String, AudioPlayer> _players = {};

  // Gemini API
  late final GenerativeModel _model;

  // Local Storage
  late final SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    // Load API Key
    // final apiKey = dotenv.env['GEMINI_API_KEY'];
    // if (apiKey == null) {
    //   if (kDebugMode) {
    //     print("🔴 GEMINI_API_KEY not found in .env file");
    //   }
    //   return;
    // }
    // _model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);

    // Initialize Local Storage
    _prefs = await SharedPreferences.getInstance();

    // Load available sounds (from a config or hardcoded)
    _loadAvailableSounds();

    // Load saved scenes
    _loadSavedScenes();

    // Initialize audio players
    for (var sound in availableSounds) {
      _players[sound.id] = AudioPlayer();
    }
  }

  void _loadAvailableSounds() {
    // In a real app, this would come from a config file or API
    availableSounds.value = [
      AmbientSound(id: 'rain', name: 'Rain 🌧️', assetPath: 'https://drive.google.com/uc?export=download&id=1efagwhdvRC7Y_kberYcrF-ba3c7Crv4U'),
      AmbientSound(id: 'ocean', name: 'Ocean 🌊', assetPath: "https://drive.google.com/uc?export=download&id=1l6O6GsNRWO55OyEocq2gd8pRjyc0PwAx"),
      AmbientSound(id: 'wind', name: 'Wind 🌬️', assetPath: 'https://drive.google.com/uc?export=download&id=1hlWwmlhV0u2bkQpthHmFo0xtKm64T2rI'),
      AmbientSound(id: 'fire', name: 'Fire 🔥', assetPath: 'https://drive.google.com/uc?export=download&id=119lrk9SfMnNc9TDFENLOrLv8o-iTdy7R'),
      AmbientSound(id: 'piano', name: 'Piano 🎹', assetPath: 'https://drive.google.com/uc?export=download&id=1sNsiuPi5u_9szmmh-k5bztKa7wNKBsqe'),
    ];

    // Initialize gains
    for (var sound in availableSounds) {
      soundGains[sound.id] = 0.0;
    }
  }

  void _loadSavedScenes() {
    final scenesJson = _prefs.getStringList('saved_scenes') ?? [];
    savedScenes.value = scenesJson.map((json) => AmbientScene.fromJson(jsonDecode(json))).toList();
  }

  Future<void> _saveScenesToPrefs() async {
    final scenesJson = savedScenes.map((scene) => jsonEncode(scene.toJson())).toList();
    await _prefs.setStringList('saved_scenes', scenesJson);
  }

  // --- AI Scene Generation ---
  Future<void> generateScene() async {
    isLoading.value = true;
    try {
      final prompt = _buildPrompt();
      final response = await _model.generateContent([Content.text(prompt)]);

      if (response.text != null) {
        // Clean the response text to ensure it is valid JSON
        String cleanedJson = response.text!;
        cleanedJson = cleanedJson.replaceAll('```json', '').replaceAll('```', '').trim();
        final json = jsonDecode(cleanedJson);

        final scene = AmbientScene.fromJson(json);
        currentScene.value = scene;
        _applyScene(scene);
      } else {
        Get.snackbar("AI Error", "Could not generate a scene. Please try again.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("🔴 Gemini Error: $e");
      }
      Get.snackbar("Error", "An unexpected error occurred.");
    } finally {
      isLoading.value = false;
    }
  }

  String _buildPrompt() {
    return '''
    You are Aura Mind’s Calm Sound Designer.
    Create a peaceful ambient sound mix for a user with:

    Mood: ${mood.value.round()}/10
    Goal: "Relax" 
    Time: ${DateTime.now().hour < 12 ? "morning" : "evening"}
    Available sounds: rain, ocean, wind, fire, piano

    Respond ONLY in valid JSON format like this example:
    {
      "title": "Peaceful Evening Rain",
      "sounds": [
        {"id": "rain", "gain": 0.8, "name": "Rain 🌧️", "assetPath": "assets/sounds/rain_soft.mp3"},
        {"id": "fire", "gain": 0.5, "name": "Fire 🔥", "assetPath": "assets/sounds/fire_crackle.mp3"},
        {"id": "piano", "gain": 0.3, "name": "Piano 🎹", "assetPath": "assets/sounds/piano_mellow.mp3"}
      ],
      "mood_label": "Serene",
      "affirmation": "Let go — breathe with the rain."
    }
    ''';
  }

  // --- Audio Control ---
  void updateGain(String soundId, double gain) {
    soundGains[soundId] = gain;
    _players[soundId]?.setVolume(gain);
  }

  void _applyScene(AmbientScene scene) {
    resetMix();
    for (var sound in scene.sounds) {
      soundGains[sound.id] = sound.gain;
    }
    togglePlayback();
  }

  Future<void> togglePlayback() async {
    if (isPlaying.value) {
      // Stop all players
      for (var player in _players.values) {
        await player.stop();
      }
      isPlaying.value = false;
    } else {
      // Start players that have gain > 0
      bool didPlay = false;
      for (var soundId in soundGains.keys) {
        final gain = soundGains[soundId] ?? 0.0;
        if (gain > 0) {
          final player = _players[soundId];
          final sound = availableSounds.firstWhere((s) => s.id == soundId);
          try {
            await player?.setUrl(sound.assetPath);
            await player?.setVolume(gain);
            player?.setLoopMode(LoopMode.one);
            player?.play();
            didPlay = true;
          } catch (e) {
            if (kDebugMode) {
              print("🔴 Audio Error for $soundId: $e");
            }
          }
        }
      }
      if (didPlay) {
        isPlaying.value = true;
      }
    }
  }

  void resetMix() {
    for (var soundId in soundGains.keys) {
      soundGains[soundId] = 0.0;
    }
    if (isPlaying.value) {
      togglePlayback(); // Stop players
    }
  }

  // --- Scene Management ---
  void saveCurrentScene() {
    final activeSounds = soundGains.entries
        .where((entry) => entry.value > 0)
        .map((entry) {
          final sound = availableSounds.firstWhere((s) => s.id == entry.key);
          return sound.copyWith(gain: entry.value);
        })
        .toList();

    if (activeSounds.isEmpty) {
      Get.snackbar("Empty Scene", "Add some sounds to the mix before saving.");
      return;
    }

    final newScene = AmbientScene(
      id: 'scene_${DateTime.now().millisecondsSinceEpoch}',
      title: currentScene.value?.title ?? "My Custom Mix",
      moodLabel: currentScene.value?.moodLabel ?? "Creative",
      affirmation: currentScene.value?.affirmation ?? "A soundscape of your own making.",
      sounds: activeSounds,
    );

    savedScenes.add(newScene);
    _saveScenesToPrefs();
    Get.snackbar("Scene Saved!", "'${newScene.title}' has been added to your library.");
  }

  void loadScene(AmbientScene scene) {
    resetMix();
    _applyScene(scene);
  }

  void deleteScene(String sceneId) {
    savedScenes.removeWhere((scene) => scene.id == sceneId);
    _saveScenesToPrefs();
  }

  @override
  void onClose() {
    // Dispose all audio players
    for (var player in _players.values) {
      player.dispose();
    }
    super.onClose();
  }
}
