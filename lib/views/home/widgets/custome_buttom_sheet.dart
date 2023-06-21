import 'package:flutter/material.dart';

class CustomeButtomSheet extends StatelessWidget {
  CustomeButtomSheet({super.key});
  List sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Select your size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          for (int i = 0; i < sizes.length; i++)
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(child: Text(sizes[i])),
            )
        ],
      ),
    );
  }
}
