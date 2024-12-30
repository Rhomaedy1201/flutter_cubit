import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/product_cubit.dart';
import 'package:flutter_cubit/pages/home/widgets/widget_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } 
          if(state is ProductSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<ProductCubit>().getProduct();
                },
                child: GridView.builder(
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
            );
          }
          return Center(child: Text("No Data"));
        },
      ),
    );
  }
}