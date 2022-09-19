import 'package:flutter/material.dart';
import 'package:product_list/models/entity/product_model.dart';
import 'package:product_list/utils/app_dimensions.dart';
import 'package:product_list/widgets/image_wrapper.dart';
import 'package:product_list/widgets/rating.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    required this.productItem,
    Key? key,
  }) : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${productItem.brand}/${productItem.category}',
          style: textTheme.headline3,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWrapper(
            imgUrl: productItem.thumbnail,
            height: AppDimensions.h,
            width: AppDimensions.xh,
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding),
            child: Text(
              productItem.title,
              style: textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.xxxm,
              vertical: AppDimensions.xxxm,
            ),
            child: Text(
              productItem.description,
              style: textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding),
            child: Rating(
              initialRating: productItem.rating.toDouble(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Buy',
                ),
              ),
              Text(
                '\$${productItem.price}',
                style: textTheme.headline4,
              ),
              Text(
                '- ${productItem.discountPercentage}%',
                style: textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
