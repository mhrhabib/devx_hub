

import 'package:dev_x_hub/apps/data/remote/dataSource/products/product_repo_impl.dart';
import 'package:dev_x_hub/apps/domain/repository/products_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allProductProvider = Provider<ProductRepo>((ref) => ProductRepoImpl());
