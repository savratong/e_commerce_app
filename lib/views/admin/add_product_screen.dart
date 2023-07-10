import 'dart:io';

import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/models/request/product_request.dart';
import 'package:e_commerce_app/viewmodels/product_viewmodel.dart';
import 'package:e_commerce_app/views/admin/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  AddNewProduct({Key? key, this.data, this.isUpdate}) : super(key: key);
  dynamic data;
  bool? isUpdate;

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  var imageFile;
  var productViewModel = ProductViewModel();
  var imageId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    ratingController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    categoryController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate!) {
      titleController.text = widget.data.attributes.title;
      ratingController.text = widget.data.attributes.rating;
      descriptionController.text = widget.data.attributes.description;
      quantityController.text = widget.data.attributes.quantity;
      categoryController.text =
          widget.data.attributes.category.data.attributes.title;
      priceController.text = widget.data.attributes.price;
      imageId = widget.data.attributes.thumbnail.data.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Center(child: Text("Add new product")),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                                  width: double.infinity,
                                  height: 250,
                                  child: widget.isUpdate!
                                      ? Image.network(
                                          "https://cms.istad.co${widget.data.attributes.thumbnail.data.attributes.url}",
                                        )
                                      : Image.network(
                                          'https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png',
                                          width: double.infinity,
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
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ratingController,
                    decoration: const InputDecoration(
                        labelText: 'Rating', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter rating';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: quantityController,
                    decoration: const InputDecoration(
                        labelText: 'Quantity', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                        labelText: 'Category', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        labelText: 'Price', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChangeNotifierProvider(
                    create: (context) => productViewModel,
                    child: Consumer<ProductViewModel>(
                      builder: (context, viewModel, _) {
                        if (viewModel.products.status == Status.COMPLETE) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  content: const Text(
                                      'New product added successfully'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        //Implement action for "Add more product"
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Add more'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Implement action for "No" or closing the post product screen
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdminScreen()),
                                        );
                                      },
                                      child: const Text('Back'),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        }

                        return InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                postProduct(widget.isUpdate);
                              }
                            },
                            child: widget.isUpdate!
                                ? CustomButton(
                                    cBtnName: "Update",
                                    cBtnWidth:
                                        MediaQuery.of(context).size.width / 2,
                                  )
                                : CustomButton(
                                    cBtnName: "Save",
                                    cBtnWidth:
                                        MediaQuery.of(context).size.width / 2,
                                  ));
                      },
                    ),
                  )
                ],
              ),
            ),
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

  void postProduct(isUpdate) {
    print('image id :: $imageId');
    var requestBody = Data(
      title: titleController.text,
      rating: (ratingController.text),
      description: (descriptionController.text),
      quantity: (quantityController.text),
      category: categoryController.text,
      thumbnail: imageId.toString(),
      price: (priceController.text),
    );
    if (isUpdate) {
      productViewModel.putProduct(requestBody, widget.data.id);
    } else {
      productViewModel.postProduct(requestBody);
    }
  }
}
