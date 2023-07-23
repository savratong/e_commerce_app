import 'package:e_commerce_app/components/custom_button.dart';
import 'package:flutter/material.dart';

class BankCardInfoScreen extends StatefulWidget {
  const BankCardInfoScreen({super.key});

  @override
  State<BankCardInfoScreen> createState() => _BankCardInfoScreenState();
}

class _BankCardInfoScreenState extends State<BankCardInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthExpiredController = TextEditingController();
  TextEditingController yearExpiredController = TextEditingController();
  TextEditingController cvvNumberController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    monthExpiredController.dispose();
    yearExpiredController.dispose();
    cvvNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Card Information"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // SizedBox(
                //   height: 250,
                //   width: double.infinity,
                //   child: Image.asset("name"),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  controller: cardNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: monthExpiredController,
                  decoration: const InputDecoration(
                      labelText: 'Month expired', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: yearExpiredController,
                  decoration: const InputDecoration(
                      labelText: 'Year expired', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: cvvNumberController,
                  decoration: const InputDecoration(
                      labelText: 'CVV', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const BankCardInfoScreen()));
                    Navigator.pop(context);
                  },
                  child: CustomButton(
                      cBtnName: "Pay Now",
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
