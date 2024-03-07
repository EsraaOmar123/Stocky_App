import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/widgets/app_colors.dart';
import 'package:project1/core/widgets/flutter_toast.dart';
import '../../../manager/capture photo cubit/capture_photo_cubit.dart';
import '../../../manager/pick image cubit/pick_image_cubit.dart';
import '../../../manager/uploud image cubit/uploud_image_cubit.dart';

customAlertDialog(BuildContext context) {
  return AlertDialog(
    elevation: 10,
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          BlocListener<PickImageCubit, PickImageState>(
            listener: (context, state) async {
              var get = BlocProvider.of<PickImageCubit>(context);
              if (state is PickImageSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is PickImageFailure) {
                showToast(
                    message: 'failure pick image', state: ToastState.error);
              }
            },
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<PickImageCubit>(context).pickImage();
                log('you are right ');
                GoRouter.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: Color(AppColors.kPrimaryColor),
                    size: 25,
                  ),
                  Text(
                    'pick image',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(AppColors.kPrimaryColor),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocListener<CapturePhotoCubit, CapturePhotoState>(
            listener: (context, state) async {
              var get = BlocProvider.of<PickImageCubit>(context);
              if (state is CapturePhotoSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is CapturePhotoFailure) {
                showToast(
                    message: 'failure pick image', state: ToastState.error);
              }
            },
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<CapturePhotoCubit>(context)
                    .capturePhoto();
                log('you are right ');
                GoRouter.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.photo_camera,
                    color: Color(AppColors.kPrimaryColor),
                    size: 25,
                  ),
                  Text(
                    'capture photo',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(AppColors.kPrimaryColor),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
