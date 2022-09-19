import 'package:flutter_test/flutter_test.dart';
import 'package:product_list/models/entity/product_model.dart';

void main() {
  test('product model test', () {
    const data = {
      "id": 1,
      "title": "iPhone 9",
      "description": "An apple mobile which is nothing like apple",
      "price": 549,
      "discountPercentage": 12.96,
      "rating": 4.69,
      "stock": 94,
      "brand": "Apple",
      "category": "smartphones",
      "thumbnail": "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
      "images": [
        "https://dummyjson.com/image/i/products/1/1.jpg",
        "https://dummyjson.com/image/i/products/1/2.jpg",
        "https://dummyjson.com/image/i/products/1/3.jpg",
        "https://dummyjson.com/image/i/products/1/4.jpg",
        "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
      ]
    };

    ProductModel product = ProductModel.fromJson(data);

    expect(product.id, 1);
    expect(product.title, "iPhone 9");
    expect(product.description, "An apple mobile which is nothing like apple");
    expect(product.price, 549);
    expect(product.discountPercentage, 12.96);
    expect(product.rating, 4.69);
    expect(product.stock, 94);
    expect(product.brand, "Apple");
    expect(product.category, "smartphones");
    expect(product.thumbnail,
        "https://dummyjson.com/image/i/products/1/thumbnail.jpg");
    expect(product.images, [
      "https://dummyjson.com/image/i/products/1/1.jpg",
      "https://dummyjson.com/image/i/products/1/2.jpg",
      "https://dummyjson.com/image/i/products/1/3.jpg",
      "https://dummyjson.com/image/i/products/1/4.jpg",
      "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
    ]);
  });
}
