import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project1/home_page.dart';
import '../../../core/components/custom_my_button.dart';
import '../../../../../core/components/flutter_toast.dart';
import '../../../core/components/app_colors.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/reset password cubit/reset_password_cubit.dart';
import '../../screens/register_screen/register_screen.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import '../common/custom_additional_content.dart';
import '../common/custom_forget_password.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast(message: 'Login Successfully', state: ToastState.success);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
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
