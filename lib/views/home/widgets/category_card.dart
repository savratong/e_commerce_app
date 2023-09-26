import 'package:flutter/material.dart';
import '../../../models/response/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryCard({
    super.key,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              color: Colors.white,
              // borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child:
                Image.network(categoryData.attributes.iconUrl), //Category Image
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              categoryData.attributes.title, //Category title
              overflow: TextOverflow.clip, maxLines: 1,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
