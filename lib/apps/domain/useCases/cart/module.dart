



import 'package:dev_x_hub/apps/data/local/repository/module.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/add_to_cart_impl.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/delete_cart_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_carts_impl.dart';

final getAllCartListProvider = Provider((ref){
  return GetCartListUseCaseImpl(ref.read(cartsProvider));
});

final addCartProvider = Provider((ref) => AddToCartUseCaseImpl(ref.read(cartsProvider)));

final deleteCartProvider = Provider((ref) => DeleteCartImpl(ref.read(cartsProvider)));