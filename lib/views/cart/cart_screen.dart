import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_app/views/cart/check_out_screen.dart';
import 'package:e_commerce_app/views/home/see_all_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/item_in_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductViewModel productViewModel;
  late SharedPreferences sharedPreferences;
  List<ProductData> cartItems = [];

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    fetchCartItems();
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
    productViewModel.loadCartItems();
    cartItems = productViewModel.cartItems;
  }

  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> fetchCartItems() async {
    productViewModel.loadCartItems();
    setState(() {
      cartItems = productViewModel.cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "My Cart",
          ),
        ),
        actions: [
          Badge(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          )
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cartItems.isEmpty)
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Image.asset(
                                    "assets/images/empty_shopping_cart.png")),
                            const Text(
                              "Your cart is empty!",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SeeAllProduct()));
                        },
                        child: CustomButton(
                            cBtnName: "Shopping Now",
                            cBtnWidth: MediaQuery.of(context).size.width),
                      )
                    ],
                  ),
                )
              else
                Expanded(
                  child: Consumer<ProductViewModel>(
                    builder: (context, productViewModel, _) {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: cartItems.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ItemInCart(
                                    productData: cartItems[index],
                                  ),
                                );
                              },
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub-total:",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "\$${productViewModel.subTotalPrice}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "VAT(10%):",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "\$${productViewModel.vatOfTotalPrice}",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // const Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Delivery fee:"),
                          //     Text(
                          //       "\$",
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Grand Total:",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "\$${productViewModel.totalPriceIncludingVAT}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckOutScreen()),
                              );
                            },
                            child: CustomButton(
                              cBtnWidth: MediaQuery.of(context).size.width,
                              cBtnName: "Check out",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
