import 'package:dev_x_hub/apps/domain/model/cart.dart' as c;
import 'package:dev_x_hub/apps/domain/model/product.dart';
import 'package:dev_x_hub/apps/presentation/viewModel/cart/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('XE',
            style: TextStyle(fontSize: 20.0, color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_rounded, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Chip(
              label: Text("30%"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.70,
              child: Image.network(product!.image!),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * .32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  product!.title!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  textWidthBasis: TextWidthBasis.parent,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    product!.rating!.rate.toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            product!.description!,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Size: '),
                              Chip(
                                label: Text("US 6"),
                                backgroundColor:
                                    Color.fromARGB(255, 168, 193, 236),
                              ),
                              Chip(
                                label: Text("US 7"),
                              ),
                              Chip(
                                label: Text("US 8"),
                              ),
                              Chip(
                                label: Text("US 9"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Available Color: "),
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.pinkAccent,
                                radius: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                radius: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      // width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product!.price}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade200,
                                minimumSize: const Size(60, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                c.Cart cart = c.Cart(
                                  product: c.Product(
                                    id: product!.id.toString(),
                                    name: product!.title,
                                    image: product!.image,
                                    price: product!.price,
                                  ),
                                );

                                ref
                                    .read(cartNotifierProvider.notifier)
                                    .addToCart(cart);
                                context.push('/carts');
                              },
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Add to cart',
                                style: TextStyle(color: Color.fromARGB(255, 52, 72, 88)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
