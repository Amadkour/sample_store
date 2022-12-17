import 'package:dartz/dartz.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/feature/contact_us/provider/api/contact_api.dart';

class ContactRepo {
  ContactRepo._singleTone();

  static final ContactRepo _instance = ContactRepo._singleTone();

  static ContactRepo get instance => _instance;

  Future<Either<FailureResponse, String>> sendMessage({
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
      print('mmkk');
    return ( await ContactAPI.instance.sendIssue(firstName: firstName,
          lastName: lastName,
          phone: phone,
          email: email,
          messageAddress: messageAddress,
          messageType: messageType,
          messageContent: messageContent)).fold((l)=>Left(l), (r) {
            return Right(r.data.toString());
     });
    } catch (e) {
    return Left(FailureResponse(statusCode: -1,
      errorMessage: e.toString()

    ));
    }
  }
}