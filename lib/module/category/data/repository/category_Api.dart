
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample_store/core/string.dart';
import 'dart:convert';
import '../model/CategoryModel.dart';

class CategoryRepository  {

  Future<List<CategoryModel>> getCategory() async {
    final response =  await http.get(Uri.parse(AppString.baseURL+'categories'));

    if (response.statusCode == 200) {
      ///--------fetch data bytes from response's body
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      ///------convert json list to model lest
      List<CategoryModel>l=[];
     jsonDecode(responseString).forEach((e)=>l.add(CategoryModel.fromJson(e)));
     return l;
    } else {
      throw Exception();
    }
  }
}