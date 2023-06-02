import 'package:dev_x_hub/apps/domain/repository/cart_repo.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/delete_cart.dart';

class DeleteCartImpl extends DeleteCartUseCase{
  DeleteCartImpl(this.cartRepo);
  final CartRepo cartRepo;
  @override
  Future<void> execute(int index)async {
    return cartRepo.deleteCart(index.toString());
  }

}