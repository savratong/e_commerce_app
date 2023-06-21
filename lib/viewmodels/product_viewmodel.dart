import 'package:e_commerce_app/data/response/api_response.dart';
import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final _productRepository = ProductRepository();

  dynamic products = ApiResponse.loading();

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
    await _productRepository.getProducts().then((res) {
      setProductList(ApiResponse.completed(res));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
    });
  }

//*POST
  // Future<dynamic> postProduct(requestBody) async {
  //   await _productRepository
  //       .postProduct(requestBody)
  //       .then((value) => setProductList(ApiResponse.completed(value)))
  //       .onError((error, stackTrace) =>
  //           setProductList(ApiResponse.error(error.toString())));
  // }
}
