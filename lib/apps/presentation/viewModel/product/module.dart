import 'package:dev_x_hub/apps/domain/useCases/products/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// To get data from internet and default data.when method

final productsFutureProvider = FutureProvider((ref) {
  return ref.read(getProductsProvider).execute();
});


//just in case of using state notifierProvider 

// class ProductsStateNotifier extends StateNotifier<List<Product>>{


//   ProductsStateNotifier(this.ref):super([]){
//     loadProducts();
//   }

//   final Ref ref;



//    void loadProducts ()async{
//     state = await ref.read(getProductsProvider).execute();
//     print("state $state");
//   }
// }



// final productListState = StateNotifierProvider<ProductsStateNotifier, List<Product>>((ref) => ProductsStateNotifier(ref));