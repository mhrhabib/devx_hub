

import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Cart>>((ref) => CartNotifier(ref));



class CartNotifier extends StateNotifier<List<Cart>>{
  CartNotifier(this.ref): super([]){
      loadCartList();
  }

  final Ref ref;


  Future<void> loadCartList() async{
    state = await ref.read(getAllCartListProvider).execute();
    print(state);
  }

  Future<void> addToCart(Cart cart) async{
      await ref.read(addCartProvider).execute(cart);
      await loadCartList();
  }

  Future<void> deleteCart(String i)async{
    await ref.read(deleteCartProvider).execute(int.parse(i));
    await loadCartList();
  }


}