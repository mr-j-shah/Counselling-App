import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

import '../../AppWidgets/AppText.dart';
import '../../AppWidgets/BottomSheetHandle.dart';
import '../../Utils/Dimensions.dart';

void showReminderBottomSheet(
  BuildContext context,
  Function(TimeOfDay) onTimeSelected,
) {
  Dimensions.init(context);
  Get.bottomSheet(
    _ReminderBottomSheet(onTimeSelected: onTimeSelected),
    isScrollControlled: true,
  );
}

class _ReminderBottomSheet extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;

  const _ReminderBottomSheet({Key? key, required this.onTimeSelected}) : super(key: key);

  @override
  _ReminderBottomSheetState createState() => _ReminderBottomSheetState();
}

class _ReminderBottomSheetState extends State<_ReminderBottomSheet> {
  int? _selectedChipIndex;
  TimeOfDay? _selectedTime;

  TimeOfDay _calculateTimeFromDuration(Duration duration) {
    final dt = DateTime.now().add(duration);
    return TimeOfDay.fromDateTime(dt);
  }

  void _selectTime(int index, {Duration? duration, TimeOfDay? time}) {
    setState(() {
      _selectedChipIndex = index;
      if (duration != null) {
        _selectedTime = _calculateTimeFromDuration(duration);
      } else {
        _selectedTime = time;
      }
    });
  }

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
              text: "Set a Reminder",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "When should we remind you to start your session?",
              color: Colors.grey.shade600,
            ),
            SizedBox(height: Dimensions.height(24)),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                _buildTimeChip("In 10 minutes", 0, duration: const Duration(minutes: 10)),
                _buildTimeChip("In 30 minutes", 1, duration: const Duration(minutes: 30)),
                _buildTimeChip("In 1 hour", 2, duration: const Duration(hours: 1)),
                _buildTimeChip("This evening (7 PM)", 3, time: const TimeOfDay(hour: 19, minute: 0)),
              ],
            ),
            SizedBox(height: Dimensions.height(24)),
            _buildCustomTimePicker(),
            SizedBox(height: Dimensions.height(32)),
            PrimaryButton(
              text: "Set Reminder",
              width: double.infinity,
              onPressed: () {
                if (_selectedTime != null) {
                  widget.onTimeSelected(_selectedTime!);
                  Get.back();
                } else {
                  Get.snackbar(
                    "No Time Selected",
                    "Please choose a time for your reminder.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeChip(String label, int index, {Duration? duration, TimeOfDay? time}) {
    final bool isSelected = _selectedChipIndex == index;
    return GestureDetector(
      onTap: () => _selectTime(index, duration: duration, time: time),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.9) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        child: AppText(
          text: label,
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildCustomTimePicker() {
    return InkWell(
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: _selectedTime ?? TimeOfDay.now(),
        );
        if (picked != null) {
          _selectTime(4, time: picked); // Use a unique index for custom
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding(16), vertical: Dimensions.padding(12)),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(Dimensions.radius(12)),
          border: Border.all(
            color: _selectedChipIndex == 4 ? primaryColor : Colors.grey.shade300,
            width: _selectedChipIndex == 4 ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.alarm_add_rounded, color: primaryColor),
                SizedBox(width: Dimensions.width(12)),
                AppText(
                  text: _selectedChipIndex == 4 && _selectedTime != null
                      ? _selectedTime!.format(context)
                      : "Choose a custom time",
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
