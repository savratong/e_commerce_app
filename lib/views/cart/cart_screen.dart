// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/item_in_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductViewModel productViewModel;
  List<ProductData> cartItems = [];

  @override
  void initState() {
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
    cartItems = productViewModel.cartItems;
    fetchCartItems();
    super.initState();
  }

  Future<void> fetchCartItems() async {
    await productViewModel.fetchAllProducts();
    setState(() {
      cartItems = productViewModel.cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final cartItems = productViewModel.cartItems;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "My Cart",
          ),
          actions: [
            Badge(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined)),
            )
          ],
        ),
        body: Consumer<ProductViewModel>(builder: (context, value, _) {
          return ListView.builder(
            itemCount: cartItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: ItemInCart(
                  productData: cartItems[index],
                ),
              );
            },
          );
        }));
  }
}
