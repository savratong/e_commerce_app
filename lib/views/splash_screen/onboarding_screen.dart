import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Expanded(
            child: Center(
              child: Text(
                "Wellcome!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteGenerator.navigationScreen,
              );
            },
            child: CustomButton(
                cBtnName: "Start Shopping",
                cBtnWidth: MediaQuery.of(context).size.width * 0.6),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
