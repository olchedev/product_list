import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/models/entity/product_model.dart';
import 'package:product_list/repositories/product_list/product_list_api.dart';
import 'package:product_list/repositories/product_list/product_list_repository.dart';

part 'product_list_state.dart';

part 'product_list_event.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(const ProductListState()) {
    on<InitialEvent>(_onInitialEvent);
    on<ScrollDown>(_onScrollDown);
  }

  final ProductListRepository _productListRepository =
      ProductListRepository(ProductListApi());

  Future<void> _onInitialEvent(
    InitialEvent event,
    Emitter<ProductListState> emit,
  ) async {
    final result = await _productListRepository.fetchProductsList(
      state.limit,
      state.skip,
    );

    emit(
      state.copyWith(
        status: ProductListStatus.success,
        productList: result,
      ),
    );
  }

  Future<void> _onScrollDown(
    ScrollDown event,
    Emitter<ProductListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductListStatus.loading,
        skip: state.skip + state.limit,
      ),
    );

    final result = await _productListRepository.fetchProductsList(
      state.limit,
      state.skip,
    );

    emit(
      state.copyWith(
        status: ProductListStatus.success,
        productList: state.productList + result,
      ),
    );
  }
}
