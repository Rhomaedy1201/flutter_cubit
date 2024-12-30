import 'package:flutter/material.dart';
import 'package:flutter_cubit/models/product.dart';

class WidgetDetailItems extends StatelessWidget {
  const WidgetDetailItems({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: const Color(0xFFECEBEB),
              image: DecorationImage(image: NetworkImage(product.image),
                fit: BoxFit.contain,
              )
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(product.category.toUpperCase(), 
                        style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w500, 
                          color: Colors.black54,
                        ), maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star_rate_rounded, color: Colors.amber, size: 20),
                      Text(product.rating.rate.toString(), 
                        style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w500, 
                          color: Colors.black,
                        ), maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5),
                      Text("(${product.rating.count})", 
                        style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w500, 
                          color: Colors.black45,
                        ), maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(product.title, 
                    style: TextStyle(
                      fontSize: 17, 
                      fontWeight: FontWeight.w500, 
                      color: Colors.black,
                    ), maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text("\$${product.price}", 
                    style: TextStyle(
                      fontSize: 17, 
                      fontWeight: FontWeight.w700, 
                      color: Colors.redAccent,
                    ), maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20),
                  Text(product.description, 
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.w500, 
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40)
        ],
      ),
    );
  }
}