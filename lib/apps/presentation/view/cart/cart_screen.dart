import 'package:dev_x_hub/apps/presentation/viewModel/cart/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: carts.length,
        itemBuilder: (context, index) {
        return Container(
          height: 100,
          padding: const EdgeInsets.all(12),
          child: ListTile(
            leading: Image.network(carts[index].product!.image!),
            title: Text(carts[index].product!.name!),
            subtitle: Text('\$${carts[index].product!.price.toString()}', style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            trailing: IconButton(onPressed: (){
              ref.read(cartNotifierProvider.notifier).deleteCart(index.toString());
            }, icon: const Icon(Icons.delete)),
          ),
        );
      },) ,
    );
  }
}