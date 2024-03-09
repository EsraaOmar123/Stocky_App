import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final int? color;
  final double? radius;
  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  final int? textColor;
  final double? horizontal;
  final double? vertical;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.radius,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
    this.horizontal,
    this.vertical,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: vertical!, horizontal: horizontal!),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(color!),
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: fontSize,
                color: Color(textColor!),
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
