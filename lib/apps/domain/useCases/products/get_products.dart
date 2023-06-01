import 'package:dev_x_hub/apps/domain/model/product.dart';

abstract class GetProductUseCase{
  Future<List<Product>> execute();
}