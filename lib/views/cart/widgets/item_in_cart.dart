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
  var productViewModel = ProductViewModel();

  @override
  void initState() {
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int quantityInCart =
        productViewModel.getProductQuantityInCart(widget.productData);
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
                        "https://cms.istad.co${widget.productData.attributes!.thumbnail!.data!.attributes!.url}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 210,
                        child: Text(
                          "${widget.productData.attributes!.title}", //Product title
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 210,
                          child: Text(
                            "${widget.productData.attributes!.description}",
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        children: [
                          const Text(
                            "Price: ",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "\$${widget.productData.attributes!.price}", //Product price
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //Remove product from cart
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  onPressed: () {
                    productViewModel.removeFromCart(widget.productData);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product removed from cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: const Text('Confirm'),
                    //         content: const Text(
                    //             'Are you sure you want to remove this product from the cart?'),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context); // Close the dialog
                    //             },
                    //             child: const Text('Cancel'),
                    //           ),
                    //           TextButton(
                    //             onPressed: () {
                    //               productViewModel
                    //                   .removeFromCart(widget.productData);
                    //               Navigator.pop(context); // Close the dialog
                    //             },
                    //             child: const Text('Remove'),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // });
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
                ),
              ),

              //Decrease and Increase product quantity in cart
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
                        onTap: () {
                          if (quantityInCart > 1) {
                            productViewModel.decreaseProductQuantityInCart(
                                widget.productData);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Center(
                            child: Text(
                          '$quantityInCart',
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                      InkWell(
                        onTap: () {
                          productViewModel.increaseProductQuantityInCart(
                            widget.productData,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.add,
                            size: 20,
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
