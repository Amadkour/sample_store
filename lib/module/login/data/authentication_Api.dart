import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sample_store/core/string.dart';
import 'dart:convert';

import '../../profile/data/model/ProfileModel.dart';

class AuthenticationRepository {
  Future<String> login(email,password) async {
    final response = await http.post(Uri.parse(AppString.baseURL + 'login'),
        body: {"email": email, "password": password});


      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      return responseString;

  }

  Future<String> logout() async {
    final response =
        await http.get(Uri.parse(AppString.baseURL + 'logout'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDNkYzdlNzY4ZDY2ODVkYjA4M2IxYTBkZTYxODA2ZThmM2IxNThlNjhhM2E5NmUyYTNmMjExODg3ZDVmOGE4YzZiNzhjZDM1MTM4MjQ3YTQiLCJpYXQiOjE2NDkyNzY0NjEuODkwNTA1LCJuYmYiOjE2NDkyNzY0NjEuODkwNTEsImV4cCI6MTY4MDgxMjQ2MS44ODM4OTksInN1YiI6IjIiLCJzY29wZXMiOltdfQ.oFFjzklE2dGogpODUhnUkhoc8JuBr_gD8-r31ZWPGSAxzbxwE-NsRpYekWYhBDoFdkxR1Xj_kRK8alMHIsrpfkjYa0hclwU8Zjps-vuMaf-07j1YyL_mt0kYGn0PFIP3SDXL4ivBeev-a1qfHVNdy8uUkJyljDNIswYgAwCOMGFCbjgZtyLMCbtQcvMxczv0pRhY_5jvnWxtAF9_9ArlmvOQ39CWNqMOKqUTwJEOYfn8XdiBqaKggRUdBemhk1f4n6cl4wU2a9Svlv5apLqrC7s_C79JlP8b8dRDisAIXDeZ7QEGB5eCSkyivO-yHvTOkOdvLjuL_MCb_nT2qnet67R0ncw_XU62cSGuBNNu6n0Udk0xblO3Bxzr2Enmq09pZ_ssmDWP4-95mcDcbkhKCgwQv4nM6MIQ18hMzR-YoI_NDrp0h9oI74DAHSxBcCnFQqF34ZIzcL-ztdoqYvhem6b1DBRb8-w_Pp1bpUfDLjJpt5FjoRGbRAQvmBiu_G9oo5zdje_DMnDhk10yQhxZbvow0Xi1AImogl6ow5-Xm-hIT0dqcVePldbUqDDuuz8XLG2iabhx-4DqPi_Jc51oJnyyPiUGspoVz0_lkzBMplH-EEFpsETyH2Uv_q0spH9R18vtJ9ySgW_HOizYMMHaPaHCPxq1ysJ1SRqp1FOGaHU'
    });
    if (response.statusCode == 200) {
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
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDNkYzdlNzY4ZDY2ODVkYjA4M2IxYTBkZTYxODA2ZThmM2IxNThlNjhhM2E5NmUyYTNmMjExODg3ZDVmOGE4YzZiNzhjZDM1MTM4MjQ3YTQiLCJpYXQiOjE2NDkyNzY0NjEuODkwNTA1LCJuYmYiOjE2NDkyNzY0NjEuODkwNTEsImV4cCI6MTY4MDgxMjQ2MS44ODM4OTksInN1YiI6IjIiLCJzY29wZXMiOltdfQ.oFFjzklE2dGogpODUhnUkhoc8JuBr_gD8-r31ZWPGSAxzbxwE-NsRpYekWYhBDoFdkxR1Xj_kRK8alMHIsrpfkjYa0hclwU8Zjps-vuMaf-07j1YyL_mt0kYGn0PFIP3SDXL4ivBeev-a1qfHVNdy8uUkJyljDNIswYgAwCOMGFCbjgZtyLMCbtQcvMxczv0pRhY_5jvnWxtAF9_9ArlmvOQ39CWNqMOKqUTwJEOYfn8XdiBqaKggRUdBemhk1f4n6cl4wU2a9Svlv5apLqrC7s_C79JlP8b8dRDisAIXDeZ7QEGB5eCSkyivO-yHvTOkOdvLjuL_MCb_nT2qnet67R0ncw_XU62cSGuBNNu6n0Udk0xblO3Bxzr2Enmq09pZ_ssmDWP4-95mcDcbkhKCgwQv4nM6MIQ18hMzR-YoI_NDrp0h9oI74DAHSxBcCnFQqF34ZIzcL-ztdoqYvhem6b1DBRb8-w_Pp1bpUfDLjJpt5FjoRGbRAQvmBiu_G9oo5zdje_DMnDhk10yQhxZbvow0Xi1AImogl6ow5-Xm-hIT0dqcVePldbUqDDuuz8XLG2iabhx-4DqPi_Jc51oJnyyPiUGspoVz0_lkzBMplH-EEFpsETyH2Uv_q0spH9R18vtJ9ySgW_HOizYMMHaPaHCPxq1ysJ1SRqp1FOGaHU'
    });
    if (response.statusCode == 200) {
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      print(jsonDecode(responseString));
      return ProfileModel.fromJson(jsonDecode(responseString));
    } else {
      throw Exception();
    }
  }
}
