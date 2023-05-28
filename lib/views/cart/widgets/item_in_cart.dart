
import 'package:flutter/material.dart';

class ItemInCart extends StatefulWidget {
  final String selectedSize;
  const ItemInCart({
    Key? key,
    required this.selectedSize,
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

  @override
  Widget build(BuildContext context) {
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
                    "https://st.mngbcn.com/rcs/pics/static/T4/fotos/outfit/S20/47094393_40-99999999_01.jpg?ts=1673336292325&imwidth=544&imdensity=2",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 210,
                    child: Text(
                      "Cami Midi Dress",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Size: ${widget.selectedSize}",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const Text(
                    "Price:",
                    style: TextStyle(
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
                // Implement your delete logic here
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
  }
}
