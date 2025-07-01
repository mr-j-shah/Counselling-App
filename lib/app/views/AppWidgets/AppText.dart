import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onClick;

  const AppText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.align,
    this.maxLines,
    this.overflow,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align,
        style: TextStyle(
          fontFamily: 'Rubik', // Rubik is now used here
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
