import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

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
            child: Image.network(
                "https://img.freepik.com/free-vector/sticker-white-t-shirt-with-coathanger_1308-88578.jpg?w=1380&t=st=1685183547~exp=1685184147~hmac=eaf61265b37373ccb2ec75fcbfe52119fcbce76d39e64ab386ffbfb5e4d48f7a"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Shirt",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
