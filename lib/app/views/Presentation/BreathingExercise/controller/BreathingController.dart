import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/widgets/ExerciseCompleteDialog.dart';

enum BreathingState { idle, gettingReady, inhaling, holding, exhaling }

class BreathingController extends GetxController {
  final RxInt selectedDuration = 2.obs; // in minutes
  final RxBool isExercising = false.obs;
  final RxInt remainingTime = 0.obs; // in seconds
  final Rx<BreathingState> breathingState = BreathingState.idle.obs;
  final RxDouble circleSize = 150.0.obs;
  final RxInt getReadyCountdown = 5.obs;
  final RxBool isSoundOn = true.obs; // To control sound

  Timer? _exerciseTimer;
  Timer? _phaseTimer;
  Timer? _getReadyTimer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    breathingState.listen((newState) {
      if (newState != BreathingState.idle &&
          newState != BreathingState.gettingReady) {
        _playSound();
      }
    });
  }

  void setDuration(int minutes) {
    selectedDuration.value = minutes;
  }

  void toggleSound(bool isOn) {
    isSoundOn.value = isOn;
  }

  void startExercise() {
    isExercising.value = true;
    breathingState.value = BreathingState.gettingReady;
    getReadyCountdown.value = 5;

    _getReadyTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (getReadyCountdown.value > 1) {
        getReadyCountdown.value--;
      } else {
        timer.cancel();
        _beginExercise();
      }
    });
  }

  void _beginExercise() {
    remainingTime.value = selectedDuration.value * 60;
    _startBreathingCycle();

    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        stopExercise(completed: true);
      }
    });
  }

  void stopExercise({bool completed = false}) {
    isExercising.value = false;
    _getReadyTimer?.cancel();
    _exerciseTimer?.cancel();
    _phaseTimer?.cancel();
    breathingState.value = BreathingState.idle;
    circleSize.value = 150.0;

    if (completed) {
      showExerciseCompleteDialog(Get.context!);
    }
  }

  void _startBreathingCycle() {
    _inhale();
    _phaseTimer = Timer.periodic(const Duration(seconds: 12), (timer) {
      if (isExercising.value) {
        _inhale();
      }
    });
  }

  void _inhale() {
    breathingState.value = BreathingState.inhaling;
    circleSize.value = 250.0;
    Future.delayed(const Duration(seconds: 4), _hold);
  }

  void _hold() {
    if (!isExercising.value) return;
    breathingState.value = BreathingState.holding;
    Future.delayed(const Duration(seconds: 4), _exhale);
  }

  void _exhale() {
    if (!isExercising.value) return;
    breathingState.value = BreathingState.exhaling;
    circleSize.value = 150.0;
  }

  Future<void> _playSound() async {
    if (isSoundOn.value) {
      try {
        await _audioPlayer.play(AssetSource('sounds/beep.mp3'));
      } catch (e) {
        print("Error playing sound: $e");
      }
    }
  }

  String get breathingStateText {
    switch (breathingState.value) {
      case BreathingState.gettingReady:
        return 'Get Ready';
      case BreathingState.inhaling:
        return 'Inhale';
      case BreathingState.holding:
        return 'Hold';
      case BreathingState.exhaling:
        return 'Exhale';
      default:
        return 'Get Ready';
    }
  }

  @override
  void onClose() {
    _getReadyTimer?.cancel();
    _exerciseTimer?.cancel();
    _phaseTimer?.cancel();
    _audioPlayer.dispose();
    super.onClose();
  }
}
