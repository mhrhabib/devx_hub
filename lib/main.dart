import 'package:dev_x_hub/apps/data/local/hive_boxes.dart';
import 'package:dev_x_hub/apps/domain/model/cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'apps/presentation/app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51NEn5WCyk67nm8lNOpZBBrt4cu2jhz0MGpyG5LKMIe0vnlLhjxvEUa4LBFkt52lIRVeFNZuUaooZomD8ZvAT8elg00YSQ8cybt';
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive ..registerAdapter(ProductAdapter())
  ..registerAdapter(CartAdapter());
  await Hive.openBox<Cart>(HiveBoxes.cart);
  runApp(const ProviderScope(child: DevXHub()));
}
