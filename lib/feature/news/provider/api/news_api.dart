import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sample_store/core/provider/remote/api_connection.dart';
import 'package:sample_store/core/provider/remote/api_endpoints.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/core/provider/remote/success_responce.dart';

class NewsApi {
  ///single tone
  static NewsApi get instance => _instance;

  NewsApi._singleTone();

  static final NewsApi _instance = NewsApi._singleTone();

  Future<Either<FailureResponse, SuccessResponse>> fetchNews({int? pageNumber = 1,int? limit=7})
  async {
    late Response<dynamic> response;
    try {
      response = await APIConnection.instance.get(EndPoint.newsPath + '?page=$pageNumber&limit=$limit');
      return Right(
        SuccessResponse(data: response.data, statusCode: response.statusCode ?? 200),
      );
    } catch (onError) {
      return Left(FailureResponse(
          errorMessage: onError.toString(), statusCode: response.statusCode ?? 500));
    }
  }
}
