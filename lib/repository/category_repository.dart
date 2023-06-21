import 'package:e_commerce_app/data/network/network_api_service.dart';
import 'package:e_commerce_app/models/response/category_model.dart';
import 'package:e_commerce_app/res/app_url.dart';

class CategoryRepository {
  final NetworkApiService _apiService = NetworkApiService();

  //*GET
  Future<Category> getCategories() async {
    try {
      dynamic response = await _apiService.getApiResponse(AppUrl.allcategories);
      return response = Category.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//*POST
  // Future<dynamic> postCategory(requestBody) async{
  //   try{
  //       var CategoryBody = CategoryRequest(data: requestBody);
  //       dynamic response = await _apiService.postApi(AppUrl.postCategory,
  //                                                       CategoryBody.toJson());
  //       return response;
  //   }catch(e){
  //     rethrow;
  //   }
  // }
}
