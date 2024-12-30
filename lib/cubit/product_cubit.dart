import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/models/product.dart';
import 'package:http/http.dart' as http;
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProduct() async {
    emit(ProductLoading());
    final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    print(response.body);
    emit(ProductSuccess(product: productFromJson(response.body)));
  }
}
