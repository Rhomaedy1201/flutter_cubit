import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/product_cubit.dart';
import 'package:flutter_cubit/pages/home/widgets/widget_categorys.dart';
import 'package:flutter_cubit/pages/home/widgets/widget_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } 
          if(state is ProductSuccess) {
            return Column(
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: const Color(0xFFC3C3C3),
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: WidgetCategorys(),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<ProductCubit>().getProduct();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.8,
                        ), 
                        itemBuilder: (context, index) {
                          return WidgetItems(product: state.product[index]);
                        },
                        itemCount: state.product.length,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text("No Data"));
        },
      ),
    );
  }
}