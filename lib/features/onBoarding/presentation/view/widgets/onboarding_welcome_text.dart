import 'package:flutter/material.dart';
import 'package:project1/core/widgets/app_colors.dart';

class OnboardingWelcomeText extends StatelessWidget {
  const OnboardingWelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
            text: 'Welcome \n to our store',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 48,
                color: Color(AppColors.kBlackColor)),
          ),
          TextSpan(
              text: '\n Get your clothes in as fast as one hour',
              style:
                  TextStyle(fontSize: 16, color: Color(AppColors.kGreyColor)))
        ]));
  }
}
