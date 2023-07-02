import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/product_viewmodel.dart';

class ItemBottomNavBar extends StatefulWidget {
  final ProductData productData;

  const ItemBottomNavBar({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  State<ItemBottomNavBar> createState() => _ItemBottomNavBarState();
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  var productViewModel = ProductViewModel();

  @override
  void initState() {
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productData = widget
        .productData; // Assign the productData parameter to the local variable

    return BottomAppBar(
      child: Consumer<ProductViewModel>(
        builder: (context, value, _) {
          return Container(
            height: 70,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "US \$${productData.attributes.price}", // Use the local productData variable
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    productViewModel.addToCart(widget
                        .productData); // Add product to cart using the local variable
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Product added to cart'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'View Cart',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: const CustomButton(
                    cBtnName: 'Add to Cart',
                    cBtnWidth: 90,
                    cBtnHight: 50,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
