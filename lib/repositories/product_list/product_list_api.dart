import 'package:dio/dio.dart';
import 'package:product_list/models/responses/product_response.dart';
import 'package:product_list/services/api_service.dart';
import 'package:product_list/utils/endpoints.dart';

class ProductListApi {
  Future<ProductResponse> fetchProducts(int limit, int skip) async {
    Response productsData = await ApiService.getRequest(
      Endpoints.getProducts,
      queryParameters: {
        'limit': limit,
        'skip': skip,
      },
    );

    ProductResponse result = ProductResponse.fromJson(productsData.data);

    return result;
  }
}
