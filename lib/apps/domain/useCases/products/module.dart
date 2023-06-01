import 'package:dev_x_hub/apps/data/remote/dataSource/products/module.dart';
import 'package:dev_x_hub/apps/domain/useCases/products/get_product_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsProvider =Provider((ref) {
  return GetProductUseCaseImpl(ref.read(allProductProvider));
});