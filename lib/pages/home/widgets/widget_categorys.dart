import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/category_product_cubit.dart';

class WidgetCategorys extends StatelessWidget {
  const WidgetCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductCubit, CategoryProductState>(
      builder: (context, state) {
        if(state is CategoryProductLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryProductSuccess) {
          return ListView.builder(
            itemCount: state.category.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Center(
                    child: Text(
                      state.category[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: Text("No Data"));
      },
    );
  }
}
