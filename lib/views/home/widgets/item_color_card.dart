import 'package:flutter/material.dart';

class ItemColorCard extends StatelessWidget {
  const ItemColorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 70,
            child: Image.network(
              "https://zandokh.com/image/catalog/products/2023-06/4212304005/Wind-Hoodie-Jacket%20(2).jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 70,
            child: Center(
              child: Text(
                "White",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
