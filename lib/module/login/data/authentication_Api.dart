import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample_store/core/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../profile/data/model/ProfileModel.dart';

class AuthenticationRepository {
  Future<String> login(email,password) async {
    final response = await http.post(Uri.parse(AppString.baseURL + 'login'),
        body: {"email": email, "password": password});
    ///--------fetch data bytes from response's body
    List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      return responseString;
  }

  Future<String> logout() async {
    final response =
        await http.get(Uri.parse(AppString.baseURL + 'logout'), headers: {
      'Authorization':(await getAuthenticationToken())!
    });
    if (response.statusCode == 200) {
      ///--------fetch data bytes from response's body
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      return responseString;
    } else {
      throw Exception();
    }
  }

  Future<ProfileModel> getProfile() async {
    final response =
        await http.get(Uri.parse(AppString.baseURL + 'user'), headers: {
      'Authorization':(await getAuthenticationToken())!
    });
    if (response.statusCode == 200) {
      ///--------fetch data bytes from response's body
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      ///------convert json  to profile model
      return ProfileModel.fromJson(jsonDecode(responseString));
    } else {
      throw Exception();
    }
  }
  Future<String?> getAuthenticationToken() async =>'Bearer '+(await SharedPreferences.getInstance()).getString(AppString.token)!;
}
