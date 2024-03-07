import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textPartOne,
    required this.textPartTwo,
  });
  final String textPartOne;
  final String textPartTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: textPartOne,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
          children: [
            TextSpan(
              text: textPartTwo,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: const Color(AppColors.kPrimaryColor),
                  ),
            )
          ]),
    );
  }
}
