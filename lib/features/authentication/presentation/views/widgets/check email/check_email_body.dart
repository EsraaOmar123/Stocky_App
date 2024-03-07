import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project1/core/widgets/app_colors.dart';
import '../../../../data/model/check_email_model.dart';
import 'custom_main_subtitle.dart';

class CheckEmailBody extends StatelessWidget {
  const CheckEmailBody({super.key, required this.checkEmailModel});
  final CheckEmailModel checkEmailModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          const CustomMainSubtitle(),
          const SizedBox(
            height: 25,
          ),
          Text(
              "We've sent you an email. Click the link in the email to ${checkEmailModel.bodyText}"),
          const SizedBox(
            height: 25,
          ),
          const Text(
              "If you don't see the email, check other places it might be ,like your junk, spam, social ,other folders"),
          const Gap(40),
          TextButton(
            onPressed: () {
              if (checkEmailModel.user != null) {
                checkEmailModel.user!.sendEmailVerification();
              }
            },
            child: const Text(
              'Resend again',
              style: TextStyle(
                  color: Color(AppColors.kPrimaryColor),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
