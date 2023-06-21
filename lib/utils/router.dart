import 'package:e_commerce_app/navigation_screen.dart';
import 'package:e_commerce_app/views/cart/cart_screen.dart';
import 'package:e_commerce_app/views/home/home_screen.dart';
import 'package:e_commerce_app/views/splash_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String onboardingPage = 'onboardingPage';
  static const String navigationScreen = 'navigationScreen';
  static const String homeScreen = 'HomeScreen';
  static const String cartScreen = 'cartScreen';



 RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    case navigationScreen:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
    case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
         case cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
        
    
    default:
        throw Exception('Route not found');
  }
}
}