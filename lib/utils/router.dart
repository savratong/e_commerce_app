import 'package:e_commerce_app/navigation_screen.dart';
import 'package:e_commerce_app/views/home/home_screen.dart';
import 'package:e_commerce_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
   static const String splashScreen = 'splashScreen';
  static const String navigationScreen = 'navigationScreen';
  static const String homeScreen = 'HomeScreen';



 RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    case navigationScreen:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
    case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        
    
    default:
        throw Exception('Route not found');
  }
}
}