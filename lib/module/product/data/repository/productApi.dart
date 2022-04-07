
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample_store/core/string.dart';
import 'dart:convert';
import '../model/ProductModel.dart';


class ProductRepository  {

  Future<List<ProductModel>> getProductData() async {
    final response =  await http.get(Uri.parse(AppString.baseURL+'products'));

    if (response.statusCode == 200) {
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      List<ProductModel>l=[];
     jsonDecode(responseString).forEach((e)=>l.add(ProductModel.fromJson(e)));
     return l;
    } else {
      throw Exception();
    }
  }
  Future<List<ProductModel>> getProductCategory(id) async {
    final response =  await http.get(Uri.parse(AppString.baseURL+'categories/'+id.toString()));
   print(response.body);
    if (response.statusCode == 200) {
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      List<ProductModel>l=[];
      jsonDecode(responseString)['products'].forEach((e)=>l.add(ProductModel.fromJson(e)));
      return l;
    } else {
      throw Exception();
    }
  }
}