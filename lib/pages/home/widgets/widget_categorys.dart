import 'package:flutter/material.dart';

class WidgetCategorys extends StatelessWidget {
  const WidgetCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
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
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Center(
              child: Text("Data $index", style: TextStyle(
                color: Colors.white, 
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
        );
      },
    );
  }
}