import 'package:e_commerce_app/data/network/network_api_service.dart';
import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/res/app_url.dart';

class ProductRepository {
  final NetworkApiService _apiService = NetworkApiService();

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
  // Future<dynamic> postProduct(requestBody) async{
  //   try{
  //       var productBody = ProductRequest(data: requestBody);
  //       dynamic response = await _apiService.postApi(AppUrl.postProduct,
  //                                                       productBody.toJson());
  //       return response;
  //   }catch(e){
  //     rethrow;
  //   }
  // }
}