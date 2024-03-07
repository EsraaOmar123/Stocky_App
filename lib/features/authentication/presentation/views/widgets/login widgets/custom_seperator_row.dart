import 'package:flutter/material.dart';
import 'custom_seperator_auth.dart';

class CustomSeperatorRow extends StatelessWidget {
  const CustomSeperatorRow({super.key, this.typeSeperatorText = 'Login'});
  final String typeSeperatorText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSeperatorAuthentication(),
        const SizedBox(
          width: 2,
        ),
        Text(
          'OR $typeSeperatorText using',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(
          width: 2,
        ),
        const CustomSeperatorAuthentication(),
      ],
    );
  }
}
