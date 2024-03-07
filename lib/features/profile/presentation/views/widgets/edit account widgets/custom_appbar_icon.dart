import 'package:flutter/material.dart';
import 'package:project1/core/widgets/app_colors.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  CustomIcon(
      {super.key,
      this.onPressed,
      required this.icon,
      this.size,
      this.iconColor});
  Function()? onPressed = () {};
  Widget icon;
  double? size = 19;
  Color? iconColor = const Color(AppColors.kBlackColor);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: iconColor, iconSize: size, onPressed: onPressed, icon: icon);
  }
}
