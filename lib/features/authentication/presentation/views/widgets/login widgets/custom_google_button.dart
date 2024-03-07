import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/flutter_toast.dart';
import '../../../../../profile/data/models/user details model/user_details.dart';
import '../../../../../profile/presentation/manager/add user details/add_user_details_cubit.dart';
import '../../../manager/login google cubit/login_google_cubit.dart';
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
          _timer?.cancel();
          await EasyLoading.dismiss();
          showToast(message: state.errorMessage, state: ToastState.error);
        } else if (state is LoginGoogleSuccess) {
          log('success login');
          await EasyLoading.showSuccess(
            'success...',
            maskType: EasyLoadingMaskType.black,
          );
          await BlocProvider.of<AddUserDetailsCubit>(context).addUser(
              UserDetailsModel(
                  id: state.user.uid,
                  name: state.user.displayName,
                  email: state.user.email!,
                  photo: state.user.photoURL ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp8HE9nJ03LBSlHivqF46xHQ640tNgo-9nnFrUMANrL3tf4lOHdDeNzjLZurWNUf3oIt8&usqp=CAU'));
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("id", state.user.uid);
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
