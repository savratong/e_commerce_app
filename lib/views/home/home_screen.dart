import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/viewmodels/category_viewmodel.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  //*fetch date from viewmodel
  var productViewModel = ProductViewModel();
  var categoryViewModel = CategoryViewModel();
  @override
  void initState() {
    productViewModel.fetchAllProducts();
    categoryViewModel.fetchAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Drawer
      drawer: const LeftDrawer(),
      backgroundColor: Colors.white,
      //*Body
      body: CustomScrollView(
        slivers: [
          //*AppBar
          SliverAppBar(
            // backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
            child: ChangeNotifierProvider<CategoryViewModel>(
              create: (context) => categoryViewModel,
              child: Consumer<CategoryViewModel>(
                builder: (create, value, _) {
                  switch (value.categories.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.COMPLETE:
                      return Container(
                        height: 90,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                            itemCount: value.categories.data!.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: CategoryCard(data: value.categories.data!.data[index]),
                              );
                            }),
                      );
                    default:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              ),
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade800),
                    ),
                  )
                ],
              ),
            ),
          ),

          //*List of Popular Products
          SliverToBoxAdapter(
            child: ChangeNotifierProvider<ProductViewModel>(
              create: (context) => productViewModel,
              child: Consumer<ProductViewModel>(builder: (create, value, _) {
                // print("${value.products}");
                switch (value.products.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case Status.COMPLETE:
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      itemCount: value.products.data!.data.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.54,
                      ),
                      itemBuilder: (builder, index) {
                        return FashionCard(
                            data: value.products.data!.data[index]);
                      },
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
