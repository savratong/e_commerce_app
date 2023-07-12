import 'dart:convert';

import 'package:e_commerce_app/data/response/api_response.dart';
import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductViewModel extends ChangeNotifier {
  final _productRepository = ProductRepository();

  dynamic products = ApiResponse();
  dynamic image = ApiResponse();

  var productLists = <ProductData>[];
  var cartLists = <ProductData>[];

  List<ProductData> _cartItems = [];
  List<ProductData> get cartItems => _cartItems;

  String kCartItemsKey = 'cart_items';

  // void addToCart(ProductData productData) {
  //   _cartItems.add(productData);
  //   notifyListeners();
  // }

  // void removeFromCart(ProductData productData) {
  //   _cartItems.remove(productData);
  //   notifyListeners();
  // }

  void addToCart(ProductData productData) {
    _cartItems.add(productData);
    saveCartItems();
    notifyListeners();
  }

  void removeFromCart(ProductData productData) {
    // _cartItems.remove(productData);
    _cartItems.removeWhere((item) =>
        item.id == productData.id); // Remove the item with matching ID
    notifyListeners();
    saveCartItems();
  }

  void saveCartItems() {
    final cartItemsJson = jsonEncode(_cartItems);
    // Save the cart items to local storage or preferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(kCartItemsKey, cartItemsJson);
    });
  }

  void loadCartItems() {
    // Load the cart items from local storage or preferences
    SharedPreferences.getInstance().then((prefs) {
      final cartItemsJson = prefs.getString(kCartItemsKey);
      if (cartItemsJson != null) {
        final cartItems = List<ProductData>.from(jsonDecode(cartItemsJson)
            .map((itemJson) => ProductData.fromJson(itemJson)));
        _cartItems = cartItems;
        notifyListeners();
      }
    });
  }

  setImageResponse(response) {
    if (response.data == null) {
      image.status = Status.LOADING;
    } else {
      image = response;
    }
    notifyListeners();
  }

  Future<dynamic> uploadImage(file) async {
    setImageResponse(ApiResponse.loading());
    await _productRepository
        .uploadImage(file)
        .then((image) => setImageResponse(ApiResponse.completed(image)))
        .onError((error, stackTrace) =>
            setImageResponse(ApiResponse.error(error.toString())));
  }

  setProductList(response) {
    if (response.data == null) {
      products.status = Status.LOADING;
    } else {
      products = response;
    }
    notifyListeners();

    // products = response;
    // notifyListeners();
  }

  //*GET
  Future<dynamic> fetchAllProducts() async {
    setProductList(ApiResponse.loading());
    await _productRepository.getProducts().then((value) {
      setProductList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
    });
  }

  //*POST
  Future<dynamic> postProduct(requestBody) async {
    setProductList(ApiResponse.loading());
    await _productRepository
        .postProduct(requestBody)
        .then((value) => setProductList(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setProductList(ApiResponse.error(error.toString())));
  }

  //*PUT
  Future<dynamic> putProduct(requestBody, id) async {
    setProductList(ApiResponse.loading());
    await _productRepository
        .putProduct(requestBody, id)
        .then((value) => setProductList(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setProductList(ApiResponse.error(error.toString())));
  }

  //*DELETE
  Future<dynamic> deleteProduct(id) async {
    setProductList(ApiResponse.loading());
    await _productRepository
        .deleteproduct(id)
        .then((value) => setProductList(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setProductList(ApiResponse.error(error.toString())));
  }
}
