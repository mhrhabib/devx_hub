
import 'package:dev_x_hub/apps/presentation/viewModel/cart/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final carts = ref.watch(cartNotifierProvider);
              return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: carts.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.network(carts[index].product!.image!),
                    title: Text(carts[index].product!.name!),
                    subtitle: Text(
                      '\$${carts[index].product!.price.toString()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .deleteCart(index.toString());
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                );
              },
            );
            },)
          ),
          ElevatedButton(
            onPressed: () async {
              await makePayment();
            },
            child: const Text("Pay"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('30', 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: "US",
          // ),
          //googlePay: const PaymentSheetGooglePay(merchantCountryCode: "US"),
          merchantDisplayName: "Habib",
          style: ThemeMode.system,
        ),
      );

      displayPaymentSheet();
    } catch (e) {
      print("exeption" + e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      Stripe.instance.presentPaymentSheet(
      ).then((value) {
         print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
      
    } catch (e) {
      print(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      dio.Response response = await dio.Dio().post(
         'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: dio.Options(
          headers: {
            "Authorization": 'Bearer sk_test_51NEn5WCyk67nm8lNH81QweW9zGsao5pxL3CKFSmrEE3GJGw6N6qmbiYjduDVZINpcxmnCx3h8UslXaV0M89UjglZ00x1MgRg9b',
            'Content-Type': 'application/x-www-form-urlencoded',
          }
        )
      );
      if(response.statusCode == 200){
        return response.data;
      }else{
        print(response.statusCode);
      }
      
    } catch (e) {
      print("exeption" + e.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price;
  }
}
