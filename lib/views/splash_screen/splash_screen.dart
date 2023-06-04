import 'package:e_commerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.navigationScreen,
                );
              },
              child: const Text("Welcome"))),
    );
  }
}
