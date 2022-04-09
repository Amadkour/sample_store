import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample_store/core/string.dart';
import 'dart:convert';
import '../model/ProductModel.dart';

class ProductRepository {
  ///--------------get all products
  Future<List<ProductModel>> getProductData() async {
    final response = await http.get(Uri.parse(AppString.baseURL + 'products'));
    if (response.statusCode == 200) {
      ///--------fetch data bytes from response's body
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);

      ///------convert json list to model lest
      List<ProductModel> l = [];
      jsonDecode(responseString)
          .forEach((e) => l.add(ProductModel.fromJson(e)));
      return l;
    } else {
      throw Exception();
    }
  }

  ///--------------get all category's products
  Future<List<ProductModel>> getProductCategory(id) async {
    final response = await http
        .get(Uri.parse(AppString.baseURL + 'categories/' + id.toString()));
    if (response.statusCode == 200) {
      ///--------fetch data bytes from response's body
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);

      ///------convert json list to model lest
      List<ProductModel> l = [];
      jsonDecode(responseString)['products']
          .forEach((e) => l.add(ProductModel.fromJson(e)));
      return l;
    } else {
      throw Exception();
    }
  }
}
