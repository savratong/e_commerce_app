import 'dart:io';

import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  var imageFile;
  var productViewModel = ProductViewModel();
  var imageId;
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var discountController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var deliveryTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChangeNotifierProvider(
                create: (context) => productViewModel,
                child: Consumer<ProductViewModel>(
                    builder: (context, viewModel, _) {
                  if (viewModel.image.status == Status.COMPLETE) {
                    imageId = viewModel.image.data!.id;
                  } else if (viewModel.image.status == Status.LOADING) {
                    return const SizedBox(
                        width: 300,
                        height: 250,
                        child: Center(child: CircularProgressIndicator()));
                  }

                  return InkWell(
                      onTap: () {
                        _getImageFromSource();
                      },
                      child: imageFile == null
                          ? SizedBox(
                              width: 300,
                              height: 250,
                              child: Image.network(
                                'https://www.onlylondon.properties/application/modules/themes/views/default/assets/images/image-placeholder.png',
                                width: 300,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.file(
                              imageFile,
                              width: 300,
                              height: 250,
                            ));
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                    hintText: 'Category', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: discountController,
                decoration: const InputDecoration(
                    hintText: 'Discount', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: deliveryFeeController,
                decoration: const InputDecoration(
                    hintText: 'Fee', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: deliveryTimeController,
                decoration: const InputDecoration(
                    hintText: 'Time', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              ChangeNotifierProvider(
                create: (context) => productViewModel,
                child: Consumer<ProductViewModel>(
                    builder: (context, viewModel, _) {
                  if (viewModel.products.status == Status.COMPLETE) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Post Success')));
                    });
                  }

                  return ElevatedButton(
                      onPressed: () {
                        // postProduct();//TODO
                      },
                      child: const Text('Save'));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getImageFromSource() async {
    var pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1900);

    if (pickedFile != null) {
      print("Image is picked");
      setState(() {
        imageFile = File(pickedFile.path);
      });
      productViewModel.uploadImage(pickedFile.path);
    }
  }

  // void postProduct() {
  //   var requestBody = Data(
  //       name: nameController.text,
  //       category: categoryController.text,
  //       discount: int.parse(discountController.text),
  //       deliveryFee: int.parse(deliveryFeeController.text),
  //       deliveryTime: int.parse(deliveryTimeController.text),
  //       picture: imageId.toString());
  //   productViewModel.postProduct(requestBody);
  // }
}
