import 'package:flutter/material.dart';

import '../../cart/cart_screen.dart';

class ItemBottomNavBar extends StatefulWidget {
  const ItemBottomNavBar({Key? key}) : super(key: key);

  @override
  State<ItemBottomNavBar> createState() => _ItemBottomNavBarState();
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Center(
                child: Text(
                  "Price US \$99.99",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return const ProductOptionsBottomSheet();
                  },
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductOptionsBottomSheet extends StatefulWidget {
  const ProductOptionsBottomSheet({Key? key}) : super(key: key);

  @override
  _ProductOptionsBottomSheetState createState() =>
      _ProductOptionsBottomSheetState();
}

class _ProductOptionsBottomSheetState extends State<ProductOptionsBottomSheet> {
  List<String> colors = ['Red', 'Green', 'Blue'];
  List<String> sizes = ['S', 'M', 'L'];

  String selectedColor = '';
  String selectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: Column(
        children: [
          const ListTile(
            title: Center(
              child: Text(
                'Select your Color and Size',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            // trailing: IconButton(
            //   icon: const Icon(Icons.close),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                child: Column(
                  children: [
                    const Text(
                      'Color',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          final color = colors[index];
                          final isSelected = selectedColor == color;
                          final selectedText = isSelected
                              ? const TextStyle(fontWeight: FontWeight.bold)
                              : null;
                          return RadioListTile<String>(
                            title: Text(
                              color,
                              style: selectedText,
                            ),
                            value: color,
                            groupValue: selectedColor,
                            onChanged: (value) {
                              setState(() {
                                selectedColor = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                child: Column(
                  children: [
                    const Text(
                      'Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          final size = sizes[index];
                          final isSelected = selectedSize == size;
                          final selectedText = isSelected
                              ? const TextStyle(fontWeight: FontWeight.bold)
                              : null;

                          return RadioListTile<String>(
                            title: Text(
                              size,
                              style: selectedText,
                            ),
                            value: size,
                            groupValue: selectedSize,
                            onChanged: (value) {
                              setState(() {
                                selectedSize = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              if (selectedColor.isNotEmpty && selectedSize.isNotEmpty) {
                Navigator.pop(context);
                // Perform action with selected color and size
                print('Selected Color: $selectedColor');
                print('Selected Size: $selectedSize');

                //success
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content:
                //         const Text('Your item added to cart successfully!'),
                //     action: SnackBarAction(
                //       label: 'Go to cart',
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const CartScreen()),
                //         );
                //       },
                //     ),
                //   ),
                // );

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Successful!"),
                    icon: const Icon(
                      Icons.done_outline_outlined,
                      size: 50,
                      color: Colors.green,
                    ),
                    // content: const Text('Your item added to cart'),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()),
                          );
                        },
                        child: const Text('Go to cart'),
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Continue shopping'),
                      ),
                    ],
                  ),
                );
              } else {
                //faled
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Attention!'),
                    content: const Text('Please select a color and size.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.93,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Add to bag",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
