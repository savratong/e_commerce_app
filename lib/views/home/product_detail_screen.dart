import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_app/views/cart/cart_screen.dart';

import 'widgets/item_bottom_navbar.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductData productData;
  bool favIconSelected;
  ProductDetailScreen({
    Key? key,
    required this.productData,
    required this.favIconSelected,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var productViewModel = ProductViewModel();

  @override
  void initState() {
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )),
                actions: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                ],
                backgroundColor: Colors.white,
                expandedHeight: 550,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://cms.istad.co${widget.productData.attributes!.thumbnail!.data!.attributes!.url}",
                    fit: BoxFit.cover,
                  ),
                ),
                // other properties...
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRect(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Text(
                                "${widget.productData.attributes!.title}", //Product's title
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                iconSize: 20,
                                icon: Icon(
                                  widget.favIconSelected
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.favIconSelected =
                                        !widget.favIconSelected;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // const Text(
                        //   "Colors availabe",
                        //   style: TextStyle(
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),

                        // //*Item color list
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5, bottom: 5),
                        //   child: SizedBox(
                        //     height: 100,
                        //     child: ListView.builder(
                        //         itemCount: 3,
                        //         scrollDirection: Axis.horizontal,
                        //         itemBuilder: (context, index) {
                        //           return const Padding(
                        //             padding: EdgeInsets.only(right: 5),
                        //             child: ItemColorCard(), //Imported
                        //           );
                        //         }),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.productData.attributes!.description}", //Product's discription
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // const Text(
                        //   "Similar items",
                        //   style: TextStyle(
                        //       fontSize: 23, fontWeight: FontWeight.bold),
                        // ),
                        // Container(
                        //   height: 355,
                        //   padding: const EdgeInsets.only(
                        //     top: 10,
                        //   ),
                        //   child: ListView.builder(
                        //       itemCount: 10,
                        //       scrollDirection: Axis.horizontal,
                        //       itemBuilder: (context, index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.only(right: 10),
                        //           child: ProductCard(productData: productData),
                        //         );
                        //       }),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<ProductViewModel>(
        builder: (context, value, _) {
          return ItemBottomNavBar(productData: widget.productData);
        },
      ),
    );
  }
}
