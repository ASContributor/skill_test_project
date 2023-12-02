part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

List<Item> productTotal = [];

final class ProductLoadingState extends ProductState {}

final class ProductLoadedState extends ProductState {
  final List<Item> product;

  ProductLoadedState(this.product) {
    productTotal = product;
  }
}

final class ProductErrorState extends ProductState {
  final String error;

  const ProductErrorState(this.error);
}
