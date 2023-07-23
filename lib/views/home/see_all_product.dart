import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_app/views/home/widgets/product_card.dart';
import 'package:e_commerce_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllProduct extends StatefulWidget {
  const SeeAllProduct({super.key});

  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {
  var productViewModel = ProductViewModel();

  @override
  void initState() {
    productViewModel.fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("All Product")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(Icons.search_outlined, size: 30))
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          slivers: [
            //*List all products
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
                          childAspectRatio: 0.55,
                        ),
                        itemBuilder: (builder, index) {
                          return ProductCard(
                            productData: value.products.data!.data[index],
                          );
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
      ),
    );
  }
}
