import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_skelton.dart';

CachedNetworkImage cachedProfilNetworkImage(
    {required String imageUrl, double height = 164, double width = 164}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
      ),
    ),
    placeholder: (context, url) =>
        customSkelton(width: 64, height: 64, borderRaduis: 26),
    errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
  );
}
