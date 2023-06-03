import 'package:dev_x_hub/apps/data/local/hive_boxes.dart';
import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'apps/presentation/app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive ..registerAdapter(ProductAdapter())
  ..registerAdapter(CartAdapter());
  await Hive.openBox<Cart>(HiveBoxes.cart);
  runApp(const ProviderScope(child: DevXHub()));
}
