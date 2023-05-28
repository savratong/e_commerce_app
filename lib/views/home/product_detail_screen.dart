import 'package:e_commerce_app/views/home/widgets/fashion_card.dart';
import 'package:flutter/material.dart';

import 'widgets/item_bottom_navbar.dart';

class ProductDetailScreenScreen extends StatelessWidget {
  const ProductDetailScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // TODO Add your onPressed logic here
                  },
                ),
              ],
              backgroundColor: Colors.white,
              expandedHeight: 550,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://st.mngbcn.com/rcs/pics/static/T4/fotos/outfit/S20/47094393_40-99999999_01.jpg?ts=1673336292325&imwidth=544&imdensity=2',
                  fit: BoxFit.cover,
                ),
              ),
              // other properties...
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: const Text(
                            "Shorts with gathered detail",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "100% cotton fabric. Light fabric. Shirt-style collar. Classic collar. Front closure. Button up. Slim fit. Long sleeve. Buttoned cuffs. Without pockets on the front part. Party and events collection.",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Similar items",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 355,
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: FashionCard(),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: const ItemBottomNavBar(),
      ),
    );
  }
}
