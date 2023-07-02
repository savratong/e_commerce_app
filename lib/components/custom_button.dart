
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String cBtnName;
  final double cBtnWidth;
  final double cBtnHight;
  
  const CustomButton({
    super.key, required this.cBtnName, required this.cBtnWidth, required this.cBtnHight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child:  Center(
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
