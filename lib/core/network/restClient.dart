import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/model/modelClass.dart';
import '../utils/style.dart';


Future<List<ProductModel>> listProduct() async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var getHeader = {"Content-Type":"application/json"};
  var response = await http.get(Url, headers: getHeader);
  var resultCode = response.statusCode;
  var resultbody = json.decode(response.body);
  if (resultCode == 200 && resultbody["status"] == "success") {
    SuccessMessege("Get Prodruct List request Successfull");
    return ProductModel.fromJsonList(resultbody["data"]);
  } else {
    ErrorMessege("Get Product List request failed");
    return [];
  }
}

Future<bool> productCreateRequest(fillitem) async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = json.encode(fillitem);
  var postHeader = {"Content-Type":"application/json"};
  var response = await http.post(Url, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultbody = json.decode(response.body);
  if (resultCode == 200 && resultbody["status"] =="success") {
    SuccessMessege("Product create request Successful!");
    return true;
  } else {
    ErrorMessege("Product create request Failed! try again letter");
    return false;
  }
}

Future<bool> DeleteProductRequest(id) async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
  var postHeader={"Content-Type": "application/json"};
  var response = await http.get(Url, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body) ;
  if (resultCode == 200 && resultBody["status"] == "success") {
    SuccessMessege("delete Successfuly");
    return true;
  } else {
    ErrorMessege("Massege delete failed");
    return false;
  }
}

Future<bool> productUpdateRequest(fillitem,id) async {
  var Url = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
  var postBody = json.encode(fillitem);
  var postHeader = {"Content-Type":"application/json"};
  var response = await http.post(Url, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultbody = json.decode(response.body);
  if (resultCode == 200 && resultbody["status"] =="success") {
    SuccessMessege("Product create request Successful!");
    return true;
  } else {
    ErrorMessege("Product create request Failed! try again letter");
    return false;
  }
}