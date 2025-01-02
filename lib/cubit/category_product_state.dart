part of 'category_product_cubit.dart';

sealed class CategoryProductState {}

final class CategoryProductInitial extends CategoryProductState {}
final class CategoryProductLoading extends CategoryProductInitial {}
final class CategoryProductSuccess extends CategoryProductInitial{
  final List<String> category;
  CategoryProductSuccess({required this.category});
}

final class CategoryProductError extends CategoryProductInitial{
  final String msg;
  CategoryProductError({required this.msg});
}