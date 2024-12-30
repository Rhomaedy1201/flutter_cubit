import 'package:flutter/material.dart';
import 'package:flutter_cubit/models/product.dart';
import 'package:flutter_cubit/pages/home/widgets/widget_detail_items.dart';

// ignore: must_be_immutable
class DetailHomePage extends StatelessWidget {
  Product product;
  DetailHomePage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Detail Product ${product.id}"),
        backgroundColor: Colors.lightBlue,
      ),
      body: WidgetDetailItems(product: product),
    );
  }
}