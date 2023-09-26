import 'package:e_commerce_app/data/response/api_response.dart';
import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/models/response/category_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/repository/category_repository.dart';

class CategoryViewModel extends ChangeNotifier {
  final _categoryRepository = CategoryRepository();

  dynamic categories = ApiResponse.loading();

  List<CategoryData> _category = [];
  List<CategoryData> get category => _category;

  setCategoryList(response) {
    if (response.data == null) {
      categories.status = Status.LOADING;
    } else {
      categories = response;
    }
    notifyListeners();

    // products = response;
    // notifyListeners();
  }

  //*GET
  Future<dynamic> fetchAllCategories() async {
    await _categoryRepository.getCategories().then((res) {
      setCategoryList(ApiResponse.completed(res));
    }).onError((error, stackTrace) {
      setCategoryList(ApiResponse.error(error.toString()));
    });
  }

//*POST
  // Future<dynamic> postProduct(requestBody) async {
  //   await _productRepository
  //       .postProduct(requestBody)
  //       .then((value) => setCategoryist(ApiResponse.completed(value)))
  //       .onError((error, stackTrace) =>
  //           setCategoryist(ApiResponse.error(error.toString())));
  // }
}
