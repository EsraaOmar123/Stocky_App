import 'package:flutter/material.dart';

import 'custom_seperator_row.dart';
import 'custom_social_media_row.dart';

class CustomAdditionalContent extends StatelessWidget {
  const CustomAdditionalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomSeperatorRow(),
          SizedBox(
            height: 30,
          ),
          CustomSocialMediaRow(),
        ],
      ),
    );
  }
}
