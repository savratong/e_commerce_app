import 'package:flutter/material.dart';

import '../product_detail_screen.dart';

class FashionCard extends StatelessWidget {
  const FashionCard({
    super.key,
  });

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
              // Navigator.pushNamed(context, "ProductDetail");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductDetailScreenScreen()),
              );
            },
            child: SizedBox(
              height: 270,
              width: 185,
              child: ClipRRect(
                // borderRadius: const BorderRadius.only(topLeft: Radius.circular(18)),
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://st.mngbcn.com/rcs/pics/static/T4/fotos/outfit/S20/47094393_40-99999999_01.jpg?ts=1673336292325&imwidth=544&imdensity=2",
                  fit: BoxFit.cover,
                ),
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
                    children: const [
                      Text(
                        "US \$99.99",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  width: 170,
                  child: Text(
                    "Cami Midi Dress",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
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
