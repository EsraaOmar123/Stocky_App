import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/components/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../models/check_email_model.dart';
import '../../controller/reset password cubit/reset_password_cubit.dart';

class CustomForgetPassword extends StatefulWidget {
  const CustomForgetPassword({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  State<CustomForgetPassword> createState() => _CustomForgetPasswordState();
}

class _CustomForgetPasswordState extends State<CustomForgetPassword> {
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) async {
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else if (state is ResetPasswordSuccess) {
          AppRoutes.router.pushReplacement(AppRoutes.checkEmail,
              extra: CheckEmailModel(
                  title: 'Login', bodyText: "Reset your account's password"));
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else {
          _timer?.cancel();
          await EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.black,
          );
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: const Text(
          'Forget password ?',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(AppColors.kPrimaryColor)),
        ),
      ),
    );
  }
}
