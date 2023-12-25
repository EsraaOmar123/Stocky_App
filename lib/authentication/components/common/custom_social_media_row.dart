import 'package:flutter/material.dart';

import 'custom_google_button.dart';

class CustomSocialMediaRow extends StatelessWidget {
  const CustomSocialMediaRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CustomGoogleButton()],
    );
  }
}
