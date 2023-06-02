

import 'package:dev_x_hub/apps/domain/model/product.dart';
import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 0)
class  Cart extends HiveObject {

  @HiveField(0)
  String? id;

  @HiveField(1)
  Product? product;


  Cart({required this.product});

}

@HiveType(typeId: 1)
class  Product extends HiveObject {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  double? price;



  Product({required this.id, required this.name, required this.image, required this.price,});

}



