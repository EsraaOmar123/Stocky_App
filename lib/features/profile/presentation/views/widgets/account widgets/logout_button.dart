import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/widgets/app_colors.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../authentication/presentation/manager/sign out cubit/sign_out_cubit.dart';

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
            await BlocProvider.of<SignOutCubit>(context).signOut();
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
