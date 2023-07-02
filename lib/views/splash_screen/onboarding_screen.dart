import 'package:e_commerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         SizedBox(
             height: MediaQuery.of(context).size.height*0.2,
           ),
          const Center(
            child: Text(
              "Wellcome!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(
             height: MediaQuery.of(context).size.height*0.2,
           ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.navigationScreen,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Start Shopping",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
        ]),
      ),
    );
  }
}
