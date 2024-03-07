import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/widgets/app_colors.dart';

class CustomMainSubtitle extends StatelessWidget {
  const CustomMainSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          FontAwesomeIcons.check,
          color: Color(AppColors.kPrimaryColor),
        ),
        Text('Check your Email', style: TextStyle()),
      ],
    );
  }
}
