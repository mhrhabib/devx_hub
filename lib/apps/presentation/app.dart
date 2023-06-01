
import 'package:dev_x_hub/apps/presentation/view/home/product_list.dart';
import 'package:flutter/material.dart';

class DevXHub extends StatelessWidget {
  const DevXHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),

      home: const ProductList(),
    );
  }
}