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

  List<ProductData> _cartItems = [];
  List<ProductData> get cartItems => _cartItems;

  // New variable to handle quantity in the cart
  Map<int, int> _quantityInCart = {}; // Product ID -> Quantity
  Map<int, int> get quantityInCart => _quantityInCart;

  String kCartItemsKey = 'cart_items'; //use for load item from local storage

  //*Sub total price
  double get subTotalPrice {
    double subTotal = 0.00;
    for (var item in _cartItems) {
      double price = double.tryParse(item.attributes?.price ?? '0.00') ?? 0.00;
      int quantity = _quantityInCart[item.id] ?? 1;
      subTotal += (price * quantity);
    }
    return double.parse(
        subTotal.toStringAsFixed(2)); // Round to 2 decimal places
  }

  //*VAT of sub total
  double get vatOfTotalPrice {
    const double vatPercentage = 0.10; // 10% VAT
    double vatAmount = subTotalPrice * vatPercentage;
    return double.parse(vatAmount.toStringAsFixed(2));
  }

  //*Total price
  double get totalPriceIncludingVAT {
    double totalPriceWithVAT = subTotalPrice + vatOfTotalPrice;
    return double.parse(totalPriceWithVAT.toStringAsFixed(2));
  }

  //*Add product to cart
  void addToCart(ProductData productData) {
    // Check if the product already exists in the cart
    int existingQuantity = _quantityInCart[productData.id] ?? 0;
    if (existingQuantity > 0) {
      // If the product exists, increase its quantity by 1
      _quantityInCart[productData.id!] = existingQuantity + 1;
    } else {
      // If the product is not in the cart, add it with quantity 1
      _cartItems.add(productData);
      _updateQuantityInCart(productData.id!, 1);
    }

    saveCartItems();
    notifyListeners();
  }

  //*Remove product from cart
  void removeFromCart(ProductData productData) {
    _cartItems.removeWhere((item) => item.id == productData.id);
    _updateQuantityInCart(productData.id!, 0); // Remove the product from cart
    saveCartItems();
    notifyListeners();
  }

  //*Update product qty
  void _updateQuantityInCart(int productId, int quantity) {
    _quantityInCart[productId] = quantity;
  }

  int getProductQuantityInCart(ProductData productData) {
    return _quantityInCart[productData.id] ?? 1;
  }

  //*Increase product qty in cart
  void increaseProductQuantityInCart(ProductData productData) {
    int currentQuantity = _quantityInCart[productData.id] ?? 0;
    _quantityInCart[productData.id!] = currentQuantity + 1;
    saveCartItems();
    notifyListeners();
  }

  //*Decrease product qty in cart
  void decreaseProductQuantityInCart(ProductData productData) {
    int currentQuantity = _quantityInCart[productData.id] ?? 0;
    if (currentQuantity > 1) {
      _quantityInCart[productData.id!] = currentQuantity - 1;
      saveCartItems();
      notifyListeners();
    }
  }

  //*Save items in cart to local storage
  void saveCartItems() {
    final cartItemsJson = jsonEncode(_cartItems);
    // Save the cart items to local storage or preferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(kCartItemsKey, cartItemsJson);
      notifyListeners();
    });
  }

  //*Load items in cart from local storage
  loadCartItems() {
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

  //*Post image
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
