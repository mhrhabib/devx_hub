import 'package:dev_x_hub/apps/presentation/view/home/product_details_screen.dart';
import 'package:dev_x_hub/apps/presentation/view/home/product_list.dart';
import 'package:dev_x_hub/apps/presentation/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'view/cart/cart_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/productList',
      builder: (context, state) => const ProductList(),
      routes: [
        GoRoute(
          path: "details",
          builder: (context, state) => const ProductDetailsPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/carts',
      builder: (context, state) => CartScreen(),
    ),
  ],
);
