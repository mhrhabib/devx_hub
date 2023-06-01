import 'package:dev_x_hub/apps/domain/model/product.dart';
import 'package:dev_x_hub/apps/domain/repository/products_repo.dart';
import 'package:dev_x_hub/apps/domain/useCases/products/get_products.dart';

class GetProductUseCaseImpl extends GetProductUseCase{
  GetProductUseCaseImpl(this.productRepo);

  final ProductRepo productRepo;

  @override
  Future<List<Product>> execute() => productRepo.getAllProduct();

}