import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Remove debug mode
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ManinScreen(),

      // routes: {
      //   "/": (context) => const BottomNavigatorBar(),
      //   "FashionCard": (context) => const FashionCard(),
      //   "ProductDetail": (context) => const ProductDetailScreenScreen(),
      // },
    );
  }
}
