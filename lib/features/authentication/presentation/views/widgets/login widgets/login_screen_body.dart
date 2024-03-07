import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/widgets/app_colors.dart';
import '../../../../../../core/widgets/custom_my_button.dart';
import '../../../../../../core/widgets/flutter_toast.dart';
import '../../../manager/auth cubit/auth_cubit.dart';
import '../../../manager/reset password cubit/reset_password_cubit.dart';
import '../build_rich_text.dart';
import '../build_text_next_to_text_button.dart';
import '../build_two_text_form_field.dart';
import 'custom_additional_content.dart';
import 'custom_forget_password.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passController;
  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          showToast(message: 'Login Successfully', state: ToastState.success);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("id", state.user.uid);
          AppRoutes.router
              .pushReplacement(AppRoutes.homeView, extra: state.user.uid);
        } else if (state is LoginFailureState) {
          showToast(message: state.error, state: ToastState.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomRichText(
                          textPartOne: 'Log ',
                          textPartTwo: 'In',
                        ),
                        const Gap(30),
                        CustomTwoTextFromField(
                          controller1: emailController,
                          controller2: passController,
                          label1: 'Email',
                          label2: 'Password',
                          isPass: false,
                          isPass2: true,
                        ),
                        const Gap(10),
                        CustomForgetPassword(
                          onTap: () {
                            BlocProvider.of<ResetPasswordCubit>(context).email =
                                emailController.text;
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .resetPassword();
                          },
                        ),
                        const Gap(40),
                        CustomButton(
                          onPressed: () {
                            AuthCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          },
                          text: 'Login',
                          height: 42,
                          color: AppColors.kPrimaryColor,
                          width: MediaQuery.of(context).size.width,
                          horizontal: 0,
                          vertical: 0,
                          radius: 10,
                          textColor: AppColors.kWhiteColor,
                          fontSize: 20,
                        ),
                        const Gap(10),
                        const CustomAdditionalContent(),
                        customTextNextToTextButton(
                          context: context,
                          text: 'Don\'t have account ?',
                          textButton: 'create account',
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRoutes.registerView);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
