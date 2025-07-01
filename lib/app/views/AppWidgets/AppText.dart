import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onClick;
  final TextStyle? style;

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
    this.style,
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
        style: style != null
            ? style!.copyWith(fontFamily: 'Rubik')
            : TextStyle(
                fontFamily: 'Rubik', // Rubik is now used here
                fontSize: Dimensions.font(fontSize),
                fontWeight: fontWeight,
                color: color,
              ),
      ),
    );
  }
}
