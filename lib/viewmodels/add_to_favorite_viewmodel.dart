import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:flutter/foundation.dart';

class FavouriteViewModel with ChangeNotifier {
  List<ProductData> _favoriteItem = [];
  List<ProductData> get favoriteItem => _favoriteItem;

  void addToFavItem(ProductData productData) {
    _favoriteItem.add(productData);
    notifyListeners();
  }

  void removeFromFavItem(ProductData productData) {
    _favoriteItem.remove(productData);
    notifyListeners();
  }
}
