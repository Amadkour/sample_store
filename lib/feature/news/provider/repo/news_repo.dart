import 'package:dartz/dartz.dart';
import 'package:sample_store/core/provider/remote/failure_response.dart';
import 'package:sample_store/core/provider/remote/success_responce.dart';
import 'package:sample_store/feature/news/provider/api/news_api.dart';
import 'package:sample_store/feature/news/provider/model/newa_model.dart';

class NewsRepo {
  ///single tone
  static NewsRepo get instance => _instance;

  NewsRepo._singleTone();

  static final NewsRepo _instance = NewsRepo._singleTone();

  Future<Either<FailureResponse, List<NewsModel>>> fetchModels({int? pageNumber=1,int? limit=7})
  async {
    try {
      ///api
      Either<FailureResponse, SuccessResponse> responseData =
          await NewsApi.instance.fetchNews(pageNumber: pageNumber,limit: limit);

      ///response
      return responseData.fold((l) => Left(l), (r) {
        if (r.data is List<dynamic>) {
          return Right(
              List<NewsModel>.from((r.data as List<dynamic>).map((e) => NewsModel.fromJson(e))));
        } else {
          return Left(FailureResponse(errorMessage: 'error in parsing', statusCode: r.statusCode));
        }
      });
    } catch (error) {
      return Left(FailureResponse(errorMessage: error.toString(), statusCode: 0));
    }
  }
}
