import 'package:product_list/models/entity/product_model.dart';
import 'package:product_list/repositories/product_list/product_list_api.dart';

class ProductListRepository {
  final ProductListApi _productListApi;

  ProductListRepository(this._productListApi);

  Future<List<ProductModel>> fetchProductsList(int limit, int skip) async {
    final productList = await _productListApi.fetchProducts(limit, skip);
    return productList.data;
  }
}
