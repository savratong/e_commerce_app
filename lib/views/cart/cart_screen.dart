import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
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
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    fetchCartItems();
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<ProductViewModel>(
                builder: (context, value, _) {
                  return ListView.builder(
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
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub-total:"),
                Text(
                  "\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("VAT(%):"),
                Text(
                  "\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery fee:"),
                Text(
                  "\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:"),
                Text(
                  "\$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              cBtnWidth: MediaQuery.of(context).size.width,
              cBtnName: "Check out",
            ),
          ],
        ),
      ),
    );
  }
}
