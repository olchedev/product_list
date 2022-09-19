import 'package:flutter/material.dart';
import 'package:product_list/models/entity/product_model.dart';
import 'package:product_list/pages/product_detail/product_detail.dart';
import 'package:product_list/utils/app_dimensions.dart';
import 'package:product_list/widgets/image_wrapper.dart';
import 'package:product_list/widgets/rating.dart';

class ProductItemListCard extends StatelessWidget {
  const ProductItemListCard({
    required this.productItem,
    Key? key,
  }) : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.all(AppDimensions.margin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWrapper(
            imgUrl: productItem.thumbnail,
            height: AppDimensions.h,
            width: AppDimensions.xh,
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    productItem.title,
                    style: textTheme.headline1,
                  ),
                ),
                Text(
                  '\$${productItem.price}',
                  style: textTheme.headline2,
                ),
              ],
            ),
          ),
          Rating(
            initialRating: productItem.rating.toDouble(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding),
            child: ElevatedButton(
              onPressed: () => _navigateToDetails(context, productItem),
              child: const Text(
                'See Details',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_navigateToDetails(BuildContext context, ProductModel productItem) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetail(
        productItem: productItem,
      ),
    ),
  );
}
