// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:istad_project_ecommerce/models/response/product_card.dart';

// import '../../constants.dart';
// import '../add_cart/add_cart.dart';
 

// class DetailsScreen extends StatelessWidget {
//   DetailsScreen({Key? key, required this.productIstadData}) : super(key: key);

//   ProductIstadData productIstadData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: product.bgColor,
//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           "Detail Screen",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: SvgPicture.asset(
//                 "assets/icons/bag1.svg",
//                 height: 40,
//                 color: Colors.black,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Image.network(
//             productIstadData.attributes.category.data.attributes.iconUrl,
//             height: MediaQuery.of(context).size.height * 0.4,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(height: defaultPadding * 1.5),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(defaultPadding,
//                   defaultPadding * 2, defaultPadding, defaultPadding),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(defaultBorderRadius * 3),
//                   topRight: Radius.circular(defaultBorderRadius * 3),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           // ignore: unnecessary_string_interpolations
//                           '${productIstadData.attributes.title}',
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                       ),
//                       const SizedBox(width: defaultPadding),
//                       // Text(
//                       //   // ignore: prefer_interpolation_to_compose_strings
//                       //   "US \$" + product2.price,
//                       //   style: Theme.of(context).textTheme.titleLarge,
//                       // ),
//                       Text(
//                         "\$${productIstadData.attributes.price}",
//                         style: Theme.of(context).textTheme.titleSmall,
//                       ),
//                     ],
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: defaultPadding),
//                     child: Text(
//                       "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
//                     ),
//                   ),
//                   // Text(
//                   //   "Rating : ${product2.rating}",
//                   //   style: Theme.of(context).textTheme.titleSmall,
//                   // ),
//                   Text(
//                     "\$${productIstadData.attributes.price}",
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const SizedBox(height: defaultPadding / 2),
//                   const SizedBox(height: defaultPadding * 2),
//                   Column(
//                     children: [
//                       Center(
//                         child: SizedBox(
//                           width: 200,
//                           height: 48,
//                           // child: ElevatedButton(


// //   onPressed: () {
//                           //     Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //           builder: (context) => const AddCardScreen()),
//                           //     );
//                           //   },
//                           //   style: ElevatedButton.styleFrom(
//                           //       backgroundColor: primaryColor,
//                           //       shape: const StadiumBorder()),
//                           //   child: const Text("Add to Card"),

//                           // ),

//                           //  command  testing1

//                           child: ElevatedButton(
//                             onPressed: () {
//                               cartSavePro.add(productIstadData);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const AddCartScreen()),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.amber.shade800,
//                                 shape: const StadiumBorder()),
//                             child: const Text("Add To Cart"),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: defaulHighSizeBox,
//                       ),
//                       Center(
//                         child: SizedBox(
//                           width: 200,
//                           height: 48,

//                           ///  command tesing  2

//                           // child: ElevatedButton(
//                           //   onPressed: () {
//                           //     cartProducts.add(productIstadData);
//                           //     Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //           builder: (context) =>
//                           //               const SaveCartScreen()),
//                           //     );
//                           //   },
//                           //   style: ElevatedButton.styleFrom(
//                           //       backgroundColor: primaryColor,
//                           //       shape: const StadiumBorder()),
//                           //   child: const Text("Save Product"),
//                           // ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// //!detail screen


// import 'package:flutter/material.dart';
// import 'package:istad_project_ecommerce/constants.dart';
 

// import 'package:istad_project_ecommerce/views/order_product/order_product.dart';

// class AddCartScreen extends StatefulWidget {
//   const AddCartScreen({super.key});

//   @override
//   State<AddCartScreen> createState() => _AddCartScreenState();
// }

// class _AddCartScreenState extends State<AddCartScreen> {
//   @override
//   void initState() {
//     super.initState();

//     cartSavePro = cartSavePro.toSet().toList();
//   }

//   // late int totalAmount;

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     int selectedItem = 1;
//   int   totalAmount = 0;
//     // for (var element in cartItem) {
//     //   // totalAmount += element.price* element.selectedItem;
//     //   totalAmount += element.price * 1;

//     // }
//     // cartItem.forEach((element) {
//     //   totalAmount += element.price * element.selectedItem;
//     // });
//     //  cartSavePro.forEach((element) {
//     //     totalAmount += (element.attributes.price * element.selectedItem) as int;
//     //   });

//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           "Carts",
//           style: TextStyle(color: Colors.black, fontSize: 30),
//         ),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Column(
//               children: cartSavePro
//                   .map<Widget>((e) => GestureDetector(
//                         // onTap: () {
//                         //   Navigator.of(context).push(
//                         //     MaterialPageRoute(
//                         //       builder: (context) => DetailsScreen(
//                         //       product: ,
//                         //       ),
//                         //     ),
//                         //   );
//                         // },
//                         child: Container(
//                             margin: const EdgeInsets.all(5),
//                             padding: const EdgeInsets.all(5),
//                             decoration: const BoxDecoration(
//                               color: Colors.white10,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(25),
//                               ),
//                             ),


// // height: 300,
//                             width: double.infinity,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         height: 200,
//                                         width: 175,
//                                         clipBehavior: Clip.antiAlias,
//                                         decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(25),
//                                           ),
//                                         ),
//                                         // child: Image.network(
//                                         //   e.productImage,
//                                         //   width: 200,
//                                         //   height: 200,
//                                         //   fit: BoxFit.fitHeight,
//                                         // ),
//                                         child: Image.network(
//                                           e.attributes.category.data.attributes
//                                               .iconUrl,
//                                           width: 200,
//                                           height: 200,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Text(
//                                         "${e.attributes.price}-\$",
//                                         style: const TextStyle(
//                                             fontSize: 22,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       // ignore: unnecessary_string_interpolations
//                                       Text("${e.attributes.title}",
//                                           style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500),
//                                           textAlign: TextAlign.center),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       TextButton(
//                                         onPressed: () {
//                                           showDialog(
//                                             context: context,
//                                             builder: (context) => Dialog(
//                                               shape:
//                                                   const RoundedRectangleBorder(


// borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   25))),
//                                               clipBehavior: Clip.antiAlias,
//                                               child: Container(
//                                                 height: 300,
//                                                 decoration: const BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                     Radius.circular(
//                                                       25,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 child: const SingleChildScrollView(
//                                                     // child: Column(
//                                                     //   children: e
//                                                     //       .productDescription
//                                                     //       .map<Widget>(
//                                                     //           (e) => ListTile(
//                                                     //                 title: Text(
//                                                     //                     "${e[0]}"),
//                                                     //                 subtitle: Text(
//                                                     //                     "${e[1]}"),
//                                                     //               ))
//                                                     //       .toList(),
//                                                     // ),
//                                                     ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: const Text("View Description"),
//                                       ),
//                                       // Text(
//                                       //   "${e.selectedItem * e.attributes.price}-\$",
//                                       //   style: const TextStyle(
//                                       //       fontSize: 25,
//                                       //       fontWeight: FontWeight.w500),
//                                       // ),
//                                       Text(
//                                         "${(e.selectedItem * double.parse(e.attributes.price)).toStringAsFixed(1)}-\$",
//                                         style: const TextStyle(
//                                           fontSize: 25,
//                                           // other styles
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 if (e.selectedItem > 1) {
//                                                   e.selectedItem -= 1;
//                                                 }
//                                               });
//                                             },
//                                             icon: const Icon(Icons.remove,


// color: Colors.red),
//                                           ),
//                                           Text(
//                                             // ignore: unnecessary_string_interpolations
//                                             "${e.selectedItem}",
//                                             style: const TextStyle(
//                                                 fontSize: 25,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                           IconButton(
//                                             onPressed: () {
//                                               setState(
//                                                 () {
//                                                   e.selectedItem += 1;
//                                                 },
//                                               );
//                                             },
//                                             icon: const Icon(
//                                               Icons.add,
//                                               color: Colors.green,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: defaulHighSizeBox,
//                                       ),
//                                       ElevatedButton(
//                                         style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.amber),
//                                         ),
//                                         onPressed: () {},
//                                         child: const Text("Order Product"),
//                                       ),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             cartSavePro.remove(e);
//                                           });
//                                         },
//                                         style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all(
//                                                     Colors.red)),
//                                         child: const Text("Remove from cart"),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )),
//                       ))
//                   .toList(),
//             ),

//             const Divider(
//               thickness: 1,
//             ),
//             // ),
//             const SizedBox(
//               height: defaulHighSizeBox * 2,
//             ),
//             Text(
//               "Total Amount  :  ${totalAmount} -\$",
//               style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               "Total Product  :     ${cartSavePro.length}\n",
//               style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),


// /// order all products
//             // ElevatedButton(
//             //   onPressed: () {
//             //     setState(() {
//             //       //cartItem.remove(e);
//             //     });
//             //   },
//             //   style: ButtonStyle(
//             //       backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
//             //   child: const Text(
//             //     "Order All Product",
//             //     style: TextStyle(
//             //       fontSize: 16,
//             //     ),
//             //   ),
//             // ),
//             const SizedBox(
//               height: defaulHighSizeBox * 2,
//             ),
//             SizedBox(
//               height: 60,
//               width: 250,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => OrderProductPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   shape: const StadiumBorder(),
//                 ),
//                 child: const Text(
//                   "Order All Product",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             const Divider(
//               thickness: 2,
//             ),
//             const SizedBox(
//               height: defaulHighSizeBox,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }