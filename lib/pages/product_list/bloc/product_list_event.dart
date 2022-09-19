part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialEvent extends ProductListEvent {}

class ScrollDown extends ProductListEvent {}
