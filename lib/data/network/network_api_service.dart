import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/data/app_exception.dart';
import 'package:e_commerce_app/models/response/image_model.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {
  dynamic responseJson;

//*Upload image

  Future uploadImage(String url, file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', file));

    var response = await request.send();

    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      var imageList = imageModelFromJson(res);
      return imageList[0];
    } else {
      print(response.reasonPhrase);
    }
  }

//*GET
  Future<dynamic> getApiResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

//*POST
  Future postApi(String url, requestBody) async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('POST', Uri.parse(url));

    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    var response = await request.send();
    print('statusu ${response.statusCode}');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

//*PUT
  Future putApi(String url, requestBody) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      return false;
    }
  }

//*DELLET
  Future<dynamic> deleteApi(url) async {
    var request = http.Request('DELETE', Uri.parse(url));

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}

returnResponse(http.Response response) {
  print('response status : ${response.statusCode}');
  switch (response.statusCode) {
    case 200:
      print('response :: ${response.body}');
      return jsonDecode(response.body);
    case 400:
      throw FetchDataException('No internet connection');
  }
}
