import 'package:dev_x_hub/apps/domain/model/cart.dart';

abstract class CartRepo{
  Future<List<Cart>> getCartList();

  Future<void> addToCart(Cart cart);

  Future<void> deleteCart(String id);
  
  Future<void> deleteAllCartItems(dynamic keys);
}