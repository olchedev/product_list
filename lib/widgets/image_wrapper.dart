import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:product_list/utils/app_dimensions.dart';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper(
      {required this.imgUrl,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  final String imgUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radius),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
