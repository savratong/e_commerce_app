import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/main_screen.dart';
import 'package:e_commerce_app/views/cart/bank_card_info_screen.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text("Check out")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                const Text(
                  "Please select payment method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                //*Method 1
                Card(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: Image.asset(
                                  "assets/logos/aba_bank_logo.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "ABA Bank",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Radio(
                          value: 0,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (dynamic t) {
                            setState(() {
                              _selectedPaymentMethod = t;
                            });
                          })
                    ],
                  ),
                ),
                //*Method 2
                Card(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: Image.asset(
                                  "assets/logos/acleda_bank_logo.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "ACELEDA Bank",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Radio(
                          value: 1,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (dynamic t) {
                            setState(() {
                              _selectedPaymentMethod = t;
                            });
                          })
                    ],
                  ),
                ),
                //*Method 3
                Card(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: Image.asset(
                                  "assets/logos/wing_bank_logo.jpg")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Wing Bank",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Radio(
                          value: 2,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (dynamic t) {
                            setState(() {
                              _selectedPaymentMethod = t;
                            });
                          })
                    ],
                  ),
                ),
                //*Method 4
                Card(
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: Image.asset(
                                  "assets/logos/case_on_delivery_logo.jpg")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Cash on delivery",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Radio(
                          value: 3,
                          groupValue: _selectedPaymentMethod,
                          onChanged: (dynamic t) {
                            setState(() {
                              _selectedPaymentMethod = t;
                            });
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    switch (_selectedPaymentMethod) {
                      case == null:
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // title: const Text('Select payment'),
                              content: const Text(
                                  'Please select payment method first!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );

                      case == 3:
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Successful!'),
                              content:
                                  const Text('Cash on delivery is selected'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ManinScreen()),
                                    );
                                  },
                                  child: const Text('Continue Shopping'),
                                ),
                              ],
                            );
                          },
                        );

                      default:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BankCardInfoScreen()));
                    }
                  },
                  child: CustomButton(
                      cBtnName: "Continue",
                      cBtnWidth: MediaQuery.of(context).size.width * 0.8),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
