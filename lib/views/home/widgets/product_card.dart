// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import '../product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  ProductData productData;
  Product? product;
  ProductCard({
    Key? key,
    required this.productData,
    this.product,
  }) : super(key: key);

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
                  builder: (context) => ProductDetailScreen(
                    productData: productData,
                    // product: product,
                  ),
                ),
              );
            },
            child: SizedBox(
              height: 270,
              width: 185,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: productData.attributes!.thumbnail != null &&
                          productData.attributes != null
                      ? Image.network(
                          "https://cms.istad.co${productData.attributes!.thumbnail!.data!.attributes!.url}",
                          // "assets/images/default_image.jpg",
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/images/default_image.jpg",
                          fit: BoxFit.cover)),
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
                        "US \$${productData.attributes!.price}", //Product Price
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
                    ("${productData.attributes!.title}"), //Product Title
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
