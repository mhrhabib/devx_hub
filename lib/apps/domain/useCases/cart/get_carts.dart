import 'package:dev_x_hub/apps/domain/model/cart.dart';

abstract class GetCartListUseCase{

  Future<List<Cart>> execute();
}