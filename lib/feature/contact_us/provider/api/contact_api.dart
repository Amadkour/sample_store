import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sample_store/core/provider/remote/api_connection.dart';
import 'package:sample_store/core/provider/remote/api_endpoints.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';

class ContactAPI {
  ContactAPI._singleTone();

  static final ContactAPI _instance = ContactAPI._singleTone();

  static ContactAPI get instance => _instance;

  Future<Either<FailureResponse, Response>> sendIssue({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String messageAddress,
    required String messageType,
    required String messageContent,
    String? imageBase64,
  }) async {
    try {
      Response<dynamic> response = await APIConnection.instance.post(
          EndPoint.contactusPath,
          FormData.fromMap({
            "firstName": firstName,
            "lastName": lastName,
            "email": phone,
            "mobile": email,
            "messageTitle": messageAddress,
            "messageType": messageType,
            "messageDesc": messageContent,
            // "attachment": imageBase64
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return Right(response);
      } else {
        print(response.data);

        return Left(FailureResponse(
          statusCode: -1,
          errorMessage: response.data,
        ));
      }
    } catch (e) {
      print(e);
      return Left(FailureResponse(
        statusCode: -1,
        errorMessage: e.toString(),
      ));
    }
  }
}
