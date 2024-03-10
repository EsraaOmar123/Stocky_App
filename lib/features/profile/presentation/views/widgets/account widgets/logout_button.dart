import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/widgets/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class LogoutAccountButton extends StatelessWidget {
  const LogoutAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomActionButton(
          buttonText: 'Log Out',
          backgroundColor: const Color.fromARGB(255, 158, 156, 156),
          fontColor: const Color(AppColors.kPrimaryColor),
          onTap: () async {
            AppRoutes.router.pushReplacement(AppRoutes.onboardingView);
          },
        ),
        const PositionedDirectional(
          start: 25,
          top: 25,
          child: Icon(
            Icons.logout_outlined,
            size: 20,
            color: Color(AppColors.kPrimaryColor),
          ),
        )
      ],
    );
  }
}
