

import 'package:dev_x_hub/apps/data/local/hiveSource/module.dart';
import 'package:dev_x_hub/apps/data/local/repository/cart_repo_impl.dart';
import 'package:dev_x_hub/apps/domain/repository/cart_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartsProvider = Provider<CartRepo>((ref) {
  return CartRepoImpl(ref.read(filesProvider));
});