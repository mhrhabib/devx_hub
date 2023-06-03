import 'package:dev_x_hub/apps/presentation/view/auth/login/login_screen.dart';
import 'package:dev_x_hub/apps/presentation/view/home/product_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const ProductList();
          }else{
            return const LoginForm();
          }
      },)
    );
  }
}