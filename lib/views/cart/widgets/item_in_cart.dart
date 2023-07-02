import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemInCart extends StatefulWidget {
  final ProductData productData;

  const ItemInCart({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  State<ItemInCart> createState() => _ItemInCartState();
}

class _ItemInCartState extends State<ItemInCart> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  var productViewModel = ProductViewModel();

  @override
  void initState() {
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, value, _) {
        return Container(
          height: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://zandokh.com/image/catalog/products/2023-06/4212304005/Wind-Hoodie-Jacket%20(2).jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 210,
                        child: Text(
                          widget.productData.attributes.title, //Product title
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Size:",
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      Text(
                        "Price:${widget.productData.attributes.price}", //Product price
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  onPressed: () {
                    // Implement your delete logic here//TODO update this logic and data flow
                    productViewModel.removeFromCart(widget.productData);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product removed from cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: decreaseQuantity,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 30, child: Center(child: Text('$quantity'))),
                      InkWell(
                        onTap: increaseQuantity,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
