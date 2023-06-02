import 'package:dev_x_hub/apps/data/local/hiveSource/hive_files.dart';
import 'package:dev_x_hub/apps/data/local/hive_boxes.dart';
import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveFileImpl extends HiveFiles{

  Box<Cart> cartBox = Hive.box(HiveBoxes.cart);

  @override
  Future<void> delete(int index) async {
    var i = cartBox.getAt(index);
     i!.delete();
  }

  @override
  Future<List<Cart?>> read(Cart cart) async{
     return cartBox.values as List<Cart>;
  }

  @override
  Future<void> write(Cart cart) async{
    cartBox.add(cart);
  }

}