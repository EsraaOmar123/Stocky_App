import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/widgets/app_colors.dart';

customAlertDialog(BuildContext context) {
  return AlertDialog(
    elevation: 10,
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
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
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
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
        ],
      ),
    ),
  );
}
