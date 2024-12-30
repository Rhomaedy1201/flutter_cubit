import 'package:flutter/material.dart';
import 'package:flutter_cubit/models/product.dart';
import 'package:flutter_cubit/pages/home/detail_page.dart';

// ignore: must_be_immutable
class WidgetItems extends StatelessWidget {
  Product product;
  WidgetItems({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailHomePage(product: product)),
        );
        // Navigator.of(context).push(DetailHomePage(id: id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                      fit: BoxFit.contain,
                    )
                  ),
                  
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, 
                        style: TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.w400, 
                          color: Colors.black,
                        ), maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text("\$${product.price}", style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black,
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
