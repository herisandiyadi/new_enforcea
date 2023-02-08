part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductResponse productResponse;

  const ProductLoaded(this.productResponse);

  @override
  List<Object> get props => [productResponse];
}

class ProductFailed extends ProductState {
  final String message;

  const ProductFailed(this.message);

  @override
  List<Object> get props => [message];
}
