import 'package:e_commerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String cBtnName;
  final double cBtnWidth;

  const CustomButton({
    super.key,
    required this.cBtnName,
    required this.cBtnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: cBtnWidth,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          cBtnName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
