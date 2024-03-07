import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/utils/assets.dart';
import '../../../../../core/widgets/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/utils/app_routes.dart';
import 'onboarding_welcome_text.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
      child: Column(
        children: [
          const OnboardingWelcomeText(),
          const SizedBox(
            height: 70,
          ),
          Image.asset(Assets.mainLogo),
          const Spacer(),
          CustomActionButton(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRoutes.homeView);
              },
              buttonText: 'Get Started'),
          const SizedBox(
            height: 25,
          ),
          CustomActionButton(
            onTap: () {
              AppRoutes.router.pushReplacement(AppRoutes.loginView);
            },
            buttonText: 'Login',
            backgroundColor: Colors.transparent,
            fontColor: const Color(AppColors.kPrimaryColor),
            borderColor: const Color(AppColors.kPrimaryColor),
          )
        ],
      ),
    );
  }
}
