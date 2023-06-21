import 'package:flutter/material.dart';
import '../../../models/response/category_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.data,
  });

  CategoryData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.network("${data.attributes.iconUrl}"), //Category Image
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              data.attributes.title, //Category title
              overflow: TextOverflow.ellipsis, maxLines: 1,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
