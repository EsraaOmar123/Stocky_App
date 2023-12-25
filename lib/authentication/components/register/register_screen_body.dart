import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import '../../../core/components/custom_my_button.dart';
import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../core/components/app_colors.dart';
import '../../../core/components/flutter_toast.dart';
import '../../../core/utils/app_routes.dart';
import '../../../models/check_email_model.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is RegisterSuccessState) {
          /*ApiConstant.userId = state.userId;
        showToast(message: 'Register successfully', state: ToastState.success);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));*/
          timer?.cancel();
          showToast(
              message: 'Register successfully', state: ToastState.success);
          AppRoutes.router.pushReplacement(AppRoutes.checkEmail,
              extra: CheckEmailModel(
                  title: 'Register', bodyText: 'activate your account'));
        } else if (state is RegisterFailureState) {
          timer?.cancel();
          showToast(message: state.error, state: ToastState.error);
        } else {
          timer?.cancel();
          await EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.black,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
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
                        textPartOne: 'Sign ',
                        textPartTwo: 'Up',
                      ),
                      const Gap(30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(AppColors.kLoginWithGoogleColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CustomTextFormField(
                            isPassword: false,
                            maxLine: 1,
                            prefixIcon: IconlyBroken.profile,
                            controller: nameController,
                            border: InputBorder.none,
                            label: 'username',
                            validate: (value) {
                              return null;
                            }),
                      ),
                      const Gap(20),
                      CustomTwoTextFromField(
                        controller1: emailController,
                        controller2: passController,
                        label1: 'Email',
                        label2: 'Password',
                        isPass: false,
                        isPass2: true,
                        prefixIcon1: IconlyBroken.message,
                        prefixIcon2: IconlyBroken.lock,
                      ),
                      const Gap(30),
                      const Gap(20),
                      CustomButton(
                        onPressed: () {
                          AuthCubit.get(context).userRegister(
                              email: emailController.text,
                              password: passController.text,
                              name: nameController.text);
                        },
                        text: 'Sign Up',
                        height: 42,
                        color: AppColors.kPrimaryColor,
                        width: MediaQuery.of(context).size.width,
                        horizontal: 0,
                        vertical: 0,
                        radius: 10,
                        textColor: AppColors.kWhiteColor,
                        fontSize: 20,
                      ),
                      const Gap(30),
                      customTextNextToTextButton(
                          context: context,
                          text: 'Already have account ?',
                          textButton: 'Login',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
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
