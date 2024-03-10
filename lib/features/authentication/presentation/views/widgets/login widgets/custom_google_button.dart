import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    this.image = Assets.googleLogo,
    this.socialmediaName = 'Google',
  });
  final String image;
  final String socialmediaName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2 - 40,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey)),
        child: CustomGoogleButtonContent(
            image: image, socialmediaName: socialmediaName),
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
