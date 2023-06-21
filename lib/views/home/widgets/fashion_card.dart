import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:flutter/material.dart';

import '../product_detail_screen.dart';

class FashionCard extends StatelessWidget {
  FashionCard({
    super.key,
    required this.data,
  });

  ProductData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          // borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), bottomRight: Radius.circular(18))
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 270,
              width: 185,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      // data.attributes!.thumbnail!.data!.attributes!.url != null
                      // ?
                      Image.asset(
                    // "https://cms.istad.co${data.attributes!.thumbnail!.data!.attributes!.url}",
                    "assets/images/default_image.jpg",
                    fit: BoxFit.cover,
                  )
                  // //*if the url null will display image asset instead
                  // : Placeholder(
                  //     fallbackHeight: 270,
                  //     fallbackWidth: 185,
                  //     child: Image.asset(
                  //       "assets/images/default_image.jpg",
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "US \$${data.attributes!.price}", //Product Price
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 170,
                  child: Text(
                    ("${data.attributes.title}"), //Product Title
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
