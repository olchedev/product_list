import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/pages/product_list/bloc/product_list_bloc.dart';
import 'package:product_list/utils/app_dimensions.dart';
import 'package:product_list/widgets/product_item_list_card.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      create: (BuildContext context) => ProductListBloc()..add(InitialEvent()),
      child: const Scaffold(
        body: Center(
          child: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (BuildContext context, state) {
        if (state.status == ProductListStatus.failure) {
          return Center(
            child: Text(
              'No data available',
              style: textTheme.headline3,
            ),
          );
        }

        if (state.status == ProductListStatus.success) {
          return SizedBox(
            width: AppDimensions.xh,
            child: LazyLoadScrollView(
              onEndOfPage: () => _loadMoreProducts(context),
              scrollOffset: 10,
              child: ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  return ProductItemListCard(
                    productItem: state.productList[index],
                  );
                },
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

_loadMoreProducts(BuildContext context) =>
    context.read<ProductListBloc>().add(ScrollDown());
