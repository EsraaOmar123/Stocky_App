import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/app_routes.dart';

PreferredSizeWidget? checkEmailAppbar(String title) {
  return AppBar(
    title:
        Text(title, style: const TextStyle(fontSize: 20, color: Colors.black)),
    centerTitle: true,
    leading: const SizedBox(
      height: 1,
    ),
    actions: [
      IconButton(
        onPressed: () {
          AppRoutes.router.pushReplacement(AppRoutes.loginView);
        },
        icon: const Icon(FontAwesomeIcons.xmark),
        color: Colors.black,
        iconSize: 24,
      ),
      const SizedBox(
        width: 5,
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
