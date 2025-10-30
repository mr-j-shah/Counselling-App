import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

class SlideToBegin extends StatefulWidget {
  final VoidCallback onSlideCompleted;
  final double height;
  final String text;

  const SlideToBegin({
    Key? key,
    required this.onSlideCompleted,
    this.height = 60,
    this.text = "Slide to Begin",
  }) : super(key: key);

  @override
  _SlideToBeginState createState() => _SlideToBeginState();
}

class _SlideToBeginState extends State<SlideToBegin> {
  double _position = 0.0;
  
  void _onHorizontalDragUpdate(DragUpdateDetails details, double widgetWidth) {
    setState(() {
      _position += details.delta.dx;
      // Clamp the position to stay within the widget bounds
      if (_position < 0) {
        _position = 0;
      }
      if (_position > widgetWidth - widget.height) {
        _position = widgetWidth - widget.height;
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details, double widgetWidth) {
    if (_position >= widgetWidth - widget.height - 1.0) {
      widget.onSlideCompleted();
    }
    // Reset the slider's position
    setState(() {
      _position = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widgetWidth = MediaQuery.of(context).size.width*0.6; // Approximate width considering parent padding

    return Container(
      width: widgetWidth,
      height: widget.height,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(widget.height / 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.text,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 10),
            left: _position,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) => _onHorizontalDragUpdate(details, widgetWidth),
              onHorizontalDragEnd: (details) => _onHorizontalDragEnd(details, widgetWidth),
              child: Container(
                width: widget.height,
                height: widget.height,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
