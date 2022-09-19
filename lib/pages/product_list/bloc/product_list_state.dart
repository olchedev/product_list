part of 'product_list_bloc.dart';

enum ProductListStatus { initial, loading, success, failure }

class ProductListState extends Equatable {
  const ProductListState({
    this.status = ProductListStatus.initial,
    this.productList = const <ProductModel>[],
    this.limit = 3,
    this.skip = 0,
  });

  final ProductListStatus status;
  final List<ProductModel> productList;
  final int limit;
  final int skip;

  ProductListState copyWith({
    ProductListStatus? status,
    List<ProductModel>? productList,
    int? skip,
  }) {
    return ProductListState(
      status: status ?? this.status,
      productList: productList ?? this.productList,
      skip: skip ?? this.skip,
    );
  }

  @override
  List<Object> get props => [status, productList, skip];
}
