import 'package:flutter/material.dart';
import '../../../../../../core/widgets/app_colors.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'Forget password ?',
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.kPrimaryColor)),
      ),
    );
  }
}
