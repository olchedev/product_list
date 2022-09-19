import 'package:product_list/models/entity/product_model.dart';

class ProductResponse {
  ProductResponse({
    required this.data,
  });

  final List<ProductModel> data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    final List<ProductModel> data = <ProductModel>[];

    for (final dynamic product in json['products'] as List<dynamic>) {
      data.add(ProductModel.fromJson(product as Map<String, dynamic>));
    }

    return ProductResponse(data: data);
  }

  ProductResponse fromJson(Map<String, dynamic> json) {
    return ProductResponse.fromJson(json);
  }
}
