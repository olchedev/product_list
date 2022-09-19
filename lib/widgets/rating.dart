import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_list/utils/app_colors.dart';
import 'package:product_list/utils/app_dimensions.dart';

class Rating extends StatelessWidget {
  const Rating({
    required this.initialRating,
    Key? key,
  }) : super(key: key);

  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      allowHalfRating: true,
      itemPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.xt,
      ),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.brightYellow,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
