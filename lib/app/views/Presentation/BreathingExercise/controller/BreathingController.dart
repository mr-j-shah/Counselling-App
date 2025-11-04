import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/widgets/ExerciseCompleteDialog.dart';

import '../../../../Constants/AppAssets.dart';

enum BreathingState { idle, gettingReady, inhaling, holding, exhaling }

class BreathingController extends GetxController {
  final RxInt selectedDuration = 2.obs; // in minutes
  final RxBool isExercising = false.obs;
  final RxInt remainingTime = 0.obs; // in seconds
  final Rx<BreathingState> breathingState = BreathingState.idle.obs;
  final RxDouble circleSize = 150.0.obs;
  final RxInt circleTime = 4.obs;
  final RxInt getReadyCountdown = 5.obs;
  final RxBool isSoundOn = true.obs;

  // Custom rhythm durations
  var inhaleDuration = 4.obs;
  var holdDuration = 4.obs;
  var exhaleDuration = 4.obs;

  Timer? _exerciseTimer;
  Timer? _countdownTimer;
  Timer? _phaseTimer;
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

  String get breathingStateText {
    switch (breathingState.value) {
      case BreathingState.inhaling:
        return "Inhale";
      case BreathingState.holding:
        return "Hold";
      case BreathingState.exhaling:
        return "Exhale";
      default:
        return "";
    }
  }

  void setDuration(int minutes) {
    selectedDuration.value = minutes;
  }

  void setCustomRhythm(int inhale, int hold, int exhale) {
    inhaleDuration.value = inhale;
    holdDuration.value = hold;
    exhaleDuration.value = exhale;
  }


  void startExercise() {
    if (isExercising.value) return;
    isExercising.value = true;
    breathingState.value = BreathingState.gettingReady;
    getReadyCountdown.value = 5;

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (getReadyCountdown.value > 1) {
        getReadyCountdown.value--;
      } else {
        timer.cancel();
        _beginBreathingCycle();
      }
    });
  }

  void _beginBreathingCycle() {
    remainingTime.value = selectedDuration.value * 60;
    circleSize.value = 150.0;
    _startPhase(BreathingState.inhaling);

    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        stopExercise();
        showExerciseCompleteDialog(Get.context!);
      }
    });
  }

  void _startPhase(BreathingState phase) {
    breathingState.value = phase;
    int duration;
    BreathingState nextPhase;

    switch (phase) {
      case BreathingState.inhaling:
        duration = inhaleDuration.value;
        nextPhase = BreathingState.holding;
        circleSize.value = 220.0;
        circleTime.value = inhaleDuration.value;
        break;
      case BreathingState.holding:
        duration = holdDuration.value;
        nextPhase = BreathingState.exhaling;
        circleTime.value = holdDuration.value;
        break;
      case BreathingState.exhaling:
        duration = exhaleDuration.value;
        nextPhase = BreathingState.inhaling; // The second hold
        circleSize.value = 150.0;
        circleTime.value = exhaleDuration.value;
        break;
      default:
        return;
    }
    
    if (isSoundOn.value) _playSound();

    _phaseTimer?.cancel();
    _phaseTimer = Timer(Duration(seconds: duration), () {
      if (isExercising.value) {
        _startPhase(nextPhase);
      }
    });
  }

  void stopExercise() {
    isExercising.value = false;
    breathingState.value = BreathingState.idle;
    _exerciseTimer?.cancel();
    _countdownTimer?.cancel();
    _phaseTimer?.cancel();
    remainingTime.value = 0;
    circleSize.value = 150.0;
  }

  void toggleSound(bool isOn) {
    isSoundOn.value = isOn;
  }

  Future<void> _playSound() async {
    if (isSoundOn.value) {
      await _audioPlayer.play(AssetSource(Appassets.beepSound));
    }
  }

  @override
  void onClose() {
    _exerciseTimer?.cancel();
    _countdownTimer?.cancel();
    _phaseTimer?.cancel();
    _audioPlayer.dispose();
    super.onClose();
  }
}
