part of 'product_cubit.dart';

sealed class ProductState {}
sealed class CategoryProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductInitial{}
final class ProductSuccess extends ProductInitial{
  final List<Product> product;
  ProductSuccess({
    required this.product,
  });
}