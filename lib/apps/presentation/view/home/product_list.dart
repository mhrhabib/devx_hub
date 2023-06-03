import 'package:dev_x_hub/apps/presentation/view/home/product_details_screen.dart';
import 'package:dev_x_hub/apps/presentation/viewModel/product/module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/product.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prodcuts List"),
        actions: [
          IconButton(onPressed: (){
            context.push("/carts");
          }, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: ()async{
             await FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: products.when(
        data: (data) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: .75,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final Product product = data[index];
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      product: data[index],
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "$index",
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.17,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(product.image!),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              product.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const SizedBox(width: 4),
                              Text(product.rating!.rate.toString()),
                            ],
                          ),
                        ],
                      ),
                      const Positioned(
                        top: 6,
                        left: 3,
                        child: Chip(
                          label: Text("30%"),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 3,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
