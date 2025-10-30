import 'dart:async';
import 'package:get/get.dart';

enum BreathingState { idle, inhaling, holding, exhaling }

class BreathingController extends GetxController {
  final RxInt selectedDuration = 2.obs; // in minutes
  final RxBool isExercising = false.obs;
  final RxInt remainingTime = 0.obs; // in seconds
  final Rx<BreathingState> breathingState = BreathingState.idle.obs;
  final RxDouble circleSize = 150.0.obs;

  Timer? _exerciseTimer;
  Timer? _phaseTimer;

  void setDuration(int minutes) {
    selectedDuration.value = minutes;
  }

  void startExercise() {
    isExercising.value = true;
    remainingTime.value = selectedDuration.value * 60;
    _startBreathingCycle();
    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        stopExercise();
      }
    });
  }

  void stopExercise() {
    isExercising.value = false;
    _exerciseTimer?.cancel();
    _phaseTimer?.cancel();
    breathingState.value = BreathingState.idle;
    circleSize.value = 150.0;
  }

  void _startBreathingCycle() {
    _inhale();
    _phaseTimer = Timer.periodic(const Duration(seconds: 12), (timer) {
      if(isExercising.value) {
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

  String get breathingStateText {
    switch (breathingState.value) {
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
    _exerciseTimer?.cancel();
    _phaseTimer?.cancel();
    super.onClose();
  }
}
