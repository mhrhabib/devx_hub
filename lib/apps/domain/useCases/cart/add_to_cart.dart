import '../../model/cart.dart';

abstract class AddToCartUseCase{

  Future<void> execute(Cart cart);
}