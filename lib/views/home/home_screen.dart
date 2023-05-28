import 'package:flutter/material.dart';

import 'see_all_product.dart';
import 'see_allcategory.dart';
import 'widgets/banner_slideshow.dart';
import 'widgets/category_card.dart';
import 'widgets/fashion_card.dart';
import 'widgets/left_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //*Drawer
        drawer: const LeftDrawer(),
        backgroundColor: Colors.white,
        //*Body
        body: CustomScrollView(
          slivers: [
            //*AppBar
            SliverAppBar(
              // backgroundColor: Colors.white,
              title: const Center(
                child: Text(
                  "271st, Phnom Penh",
                  style: TextStyle(
                    fontSize: 18,
                    //color: Colors.black,
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),

            //*SearchBox
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                // height: 250,
                // color: Colors.blue,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.search_rounded,
                                size: 30,
                                color: Colors.grey.shade700,
                              ),
                              Text(
                                "Search items...",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade700),
                              )
                            ],
                          )),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list_outlined,
                            size: 35,
                          )),
                    )
                  ],
                ),
              ),
            ),

            //*Banner SlideShow
            const SliverToBoxAdapter(
              child: BannerSlideshow(),
            ),

            //*Category title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SeeAllCategory()),
                          );
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade800),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),

            //*Category items
            SliverToBoxAdapter(
              child: Container(
                height: 90,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 18),
                        child: CategoryCard(),
                      );
                    }),
              ),
            ),

            //*Popular title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SeeAllProduct()),
                        );
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade800),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //*List of Popular Products
            SliverToBoxAdapter(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.54,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const FashionCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
