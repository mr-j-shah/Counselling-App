import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class SoundToggleSlider extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onToggle;
  final double height;
  final double width;

  const SoundToggleSlider({
    super.key,
    this.initialValue = true,
    required this.onToggle,
    this.height = 50,
    this.width = 100,
  });

  @override
  State<SoundToggleSlider> createState() => _SoundToggleSliderState();
}

class _SoundToggleSliderState extends State<SoundToggleSlider> {
  late bool isSoundOn;
  double _dragExtent = 0.0;

  @override
  void initState() {
    super.initState();
    isSoundOn = widget.initialValue;
  }

  void _toggleState() {
    setState(() {
      isSoundOn = !isSoundOn;
    });
    widget.onToggle(isSoundOn);
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return GestureDetector(
      onTap: _toggleState,
      onHorizontalDragStart: (_) {
        _dragExtent = 0.0;
      },
      onHorizontalDragUpdate: (details) {
        _dragExtent += details.primaryDelta ?? 0;
      },
      onHorizontalDragEnd: (_) {
        if (_dragExtent.abs() > 20.0) { // Drag threshold
          if (_dragExtent > 0 && !isSoundOn) {
            _toggleState(); // Dragged right to turn sound on
          } else if (_dragExtent < 0 && isSoundOn) {
            _toggleState(); // Dragged left to turn sound off
          }
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(widget.height / 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Sliding Thumb
            AnimatedAlign(
              alignment:
                  isSoundOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Container(
                width: widget.height - 4, // Inner circle smaller than track
                height: widget.height - 4,
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Icons
            Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.volume_off_rounded,
                    color: isSoundOn ? primaryColor : Colors.white,
                    size: widget.height * 0.45,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.volume_up_rounded,
                    color: isSoundOn ? Colors.white : primaryColor,
                    size: widget.height * 0.45,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
