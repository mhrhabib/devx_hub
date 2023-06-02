import '../../../domain/model/cart.dart';

abstract class HiveFiles{

  Future<List<Cart?>> read(Cart cart);

  Future<void> write(Cart cart);

  Future<void> delete(int index);
}