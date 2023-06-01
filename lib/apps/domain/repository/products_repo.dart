
import 'package:dev_x_hub/apps/domain/model/product.dart';

abstract class ProductRepo{

  Future<List<Product>> getAllProduct();
  

}