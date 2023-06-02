
import 'package:dev_x_hub/apps/presentation/routes.dart';
import 'package:flutter/material.dart';

class DevXHub extends StatelessWidget {
  const DevXHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),

      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}