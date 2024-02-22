part of 'all_product_cubit.dart';

@immutable
sealed class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductSuccess extends AllProductState {
  final List<ProductModel> products;

  AllProductSuccess(this.products);
}

final class AllProductLoading extends AllProductState {}

final class AllProductFailure extends AllProductState {
  final String erorrMassage;

  AllProductFailure(this.erorrMassage);
}
