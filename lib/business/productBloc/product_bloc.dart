// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/product.dart';
import '../../data/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  productRepo ProRepo;
  ProductBloc({
    required this.ProRepo,
  }) : super(ProductLoadingState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductEvent) {
        emit(ProductLoadingState());
        List<Item> product = await ProRepo.productList();
        if (product.isEmpty) {
          emit(const ProductErrorState('Unable to Load Pfroducts'));
        } else {
          emit(ProductLoadedState(product));
        }
      }
    });
  }
}
