import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:dev_x_hub/apps/domain/repository/cart_repo.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/get_carts.dart';

class GetCartListUseCaseImpl extends GetCartListUseCase{
  GetCartListUseCaseImpl(this.cartRepo);
  final CartRepo cartRepo;

  @override
  Future<List<Cart>> execute()=> cartRepo.getCartList();

}