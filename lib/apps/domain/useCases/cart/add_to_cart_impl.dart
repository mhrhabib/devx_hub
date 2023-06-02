import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:dev_x_hub/apps/domain/repository/cart_repo.dart';
import 'package:dev_x_hub/apps/domain/useCases/cart/add_to_cart.dart';

class AddToCartUseCaseImpl extends AddToCartUseCase{

  AddToCartUseCaseImpl(this.cartRepo);
  final CartRepo cartRepo;

  @override
  Future<void> execute(Cart cart) async {
    await cartRepo.addToCart(cart);
  }

}