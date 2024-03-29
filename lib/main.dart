import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/utils/router.dart';
import 'package:e_commerce_app/viewmodels/add_to_favorite_viewmodel.dart';
import 'package:e_commerce_app/viewmodels/category_viewmodel.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => FavouriteViewModel()),

        // Add more providers if needed
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldColor,
            primarySwatch: Colors.blue,
            primaryColor: primaryColor),

        debugShowCheckedModeBanner: false, //Remove debug mode
        initialRoute: RouteGenerator.onboardingPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
