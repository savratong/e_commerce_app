import 'package:e_commerce_app/data/network/network_api_service.dart';
import 'package:e_commerce_app/models/request/product_request.dart';
import 'package:e_commerce_app/models/response/image_model.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/res/app_url.dart';

class ProductRepository {
  final NetworkApiService _apiService = NetworkApiService();

  //*Upload Image
  Future<ImageModel> uploadImage(file) async{
    try{
        dynamic response = await _apiService.uploadImage(AppUrl.uploadImage, file);
        return response;
    }catch(e){
      rethrow;
    }
  }

  //*GET
  Future<Product> getProducts() async {
    try {
      dynamic response = await _apiService.getApiResponse(AppUrl.allproducts);
      return response = Product.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//*POST
  Future<dynamic> postProduct(requestBody) async{
    try{
        var productBody = ProductRequest(data: requestBody);
        dynamic response = await _apiService.postApi(AppUrl.postProduct,
                                                        productBody.toJson());
        return response;
    }catch(e){
      rethrow;
    }
  }
}
