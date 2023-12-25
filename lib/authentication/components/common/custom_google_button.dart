import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/components/flutter_toast.dart';
import '../../../core/utils/app_routes.dart';
import '../../../generated/assets.dart';
import '../../controller/login google cubit/login_google_cubit.dart';
//import '../../../../../../core/widgets/config_loading.dart';

class CustomGoogleButton extends StatefulWidget {
  const CustomGoogleButton({
    super.key,
    this.image = Assets.googleLogo,
    this.socialmediaName = 'Google',
  });
  final String image;
  final String socialmediaName;

  @override
  State<CustomGoogleButton> createState() => _CustomGoogleButtonState();
}

class _CustomGoogleButtonState extends State<CustomGoogleButton> {
  /*void initState() {
    BlocProvider.of<GetCustomerIdCubit>(context).getCustomerId();
    super.initState();
  }*/

  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginGoogleCubit, LoginGoogleState>(
      listener: (context, state) async {
        if (state is LoginGoogleFailure) {
          log(state.errorMessage);
          showToast(message: state.errorMessage, state: ToastState.error);
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else if (state is LoginGoogleSuccess) {
          log('success login');
          await EasyLoading.showSuccess(
            'success...',
            maskType: EasyLoadingMaskType.black,
          );
          _timer?.cancel();
          await EasyLoading.dismiss();
          AppRoutes.router.pushReplacement(AppRoutes.homeView);
        } else {
          _timer?.cancel();
          await EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.black,
          );
        }
      },
      child: InkWell(
        onTap: () async {
          await BlocProvider.of<LoginGoogleCubit>(context).signInWithGoogle();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: CustomGoogleButtonContent(
              image: widget.image, socialmediaName: widget.socialmediaName),
        ),
      ),
    );
  }
}

class CustomGoogleButtonContent extends StatelessWidget {
  const CustomGoogleButtonContent({
    super.key,
    required this.image,
    required this.socialmediaName,
  });

  final String image;
  final String socialmediaName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
        Text(
          socialmediaName,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}
