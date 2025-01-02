import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());

  void getCategories() async {
    emit(CategoryProductLoading());
    try {
      final response = await http.get(Uri.parse("${dotenv.env['HOST']}/products/categories"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final categories = List<String>.from(data);
        emit(CategoryProductSuccess(category: categories));
      } else {
        emit(CategoryProductError(msg: "Failed to fetch categories"));
      }
    } catch (e) {
      emit(CategoryProductError(msg: "An error occurred: $e"));
    }
  }
}
