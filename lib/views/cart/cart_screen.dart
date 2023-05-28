// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'widgets/item_in_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(
            child: Text(
              "My Cart",
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
          ],
        ),

        //*List of cart's item
        body: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: ItemInCart(
                  selectedSize: '',
                ),
              );
            }),
      ),
    );
  }
}
