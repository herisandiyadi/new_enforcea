import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_ukm_desk/services/data_model/product/product_response.dart';
import 'package:new_ukm_desk/services/repository/product/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> getProduct() async {
    try {
      emit(ProductLoading());
      final productResponse = await productRepository.getProductList();
      emit(ProductLoaded(productResponse));
    } catch (e) {
      emit(ProductLoading());
      emit(ProductFailed(e.toString()));
    }
  }
}
