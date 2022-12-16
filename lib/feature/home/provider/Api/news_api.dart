// import 'package:dio/dio.dart';
// import 'package:res/core/constant/api_connection.dart';
// import 'package:res/core/constant/shared.dart';
// import 'package:res/modules/dashboard/modules/home/providers/model/real_state_model.dart';
//
// class NewsAPI extends APIConnection {
//   Future<Map<String, dynamic>> getFavouriteStates() async {
//     final Response<Map<dynamic, dynamic>> res = await get(
//       'investor/favorites',
//     );
//     final List<RealStateModel> l = <RealStateModel>[];
//     (res.data!['data'] as List<dynamic>).forEach((dynamic json) {
//       try {
//         l.add(RealStateModel.fromJson(json as Map<String, dynamic>));
//       } catch (error) {
//         //TODO
//       }
//     });
//     return <String, dynamic>{'data': l};
//   }
//
//   Future<Map<dynamic, dynamic>> removeFromFavorite(int id) async {
//     final Response<Map<dynamic, dynamic>> res = await Dio().delete(
//         '${setting.baseUrlAPI}/investor/favorites/$id/delete',
//         options: Options(headers: <String, String>{
//           'Authorization': (await readSecureKey(userToken))!,
//         }));
//     return res.data!;
//   }
// }
