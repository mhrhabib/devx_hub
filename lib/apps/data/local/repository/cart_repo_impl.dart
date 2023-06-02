import 'package:dev_x_hub/apps/data/local/hiveSource/hive_files.dart';
import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:dev_x_hub/apps/domain/repository/cart_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive_boxes.dart';

class CartRepoImpl extends CartRepo {
  CartRepoImpl(this.files);

  final HiveFiles? files;
  Box<Cart> cartBox = Hive.box(HiveBoxes.cart);

  @override
  Future<void> addToCart(Cart cart) async {
    files?.write(cart);
  }

  @override
  Future<void> deleteAllCartItems(keys) async {
    cartBox.deleteAll(keys);
  }

  @override
  Future<void> deleteCart(String id) {
    return files!.delete(int.parse(id));
  }

  @override
  Future<List<Cart>> getCartList() async {
    List<Cart> x = [];
    if (cartBox.values.isNotEmpty) {
      for(var cart in cartBox.values){
        x.add(cart);
      }
    }
    return x;
  }
}
