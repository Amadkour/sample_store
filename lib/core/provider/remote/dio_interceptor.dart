import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../global_bloc/app_bloc.dart';
import '../../res/theme/colors.dart';
import '../../widget/message.dart';
import '../../widget/my_dialog.dart';
import 'api_connection.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    final DioErrorType errorType = err.type;
    if (errorType == DioErrorType.sendTimeout ||
        errorType == DioErrorType.receiveTimeout ||
        errorType == DioErrorType.connectTimeout) {
      showTimeOutDialog(err);
    } else {
      await _handleDialogError(err);
    }
    // return handler.reject(error);
  }

  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.path);
    options.headers = <String, String>{
      // 'Accept-Language': sharedPrefs.getString('lang')!,
      'Accept': 'application/json',
      // 'Content-type':'application/json'
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  Future<void> _handleDialogError(DioError error) async {
    final Response<dynamic>? response = error.response;
    final int? statusCode = response != null ? response.statusCode : 404;
    switch (statusCode) {
      case 400:
        show400Dialog(error);
        break;
      case 302:
      case 401:
        show401Dialog();
        break;
      case 403:
        MyToast(tr('Forbidden'));
        break;
      case 404:
        show404Dialog();
        break;
      case 500:
        show500Dialog(error);
        break;
      case 502:
        MyToast(tr('Bad gateway'));
        break;
      default:
        MyToast(error.error);
    }
  }

  void show400Dialog(DioError error) {
    final APIConnection apiConnection = APIConnection();
    final String url = error.requestOptions.path.substring(error.requestOptions.baseUrl.length + 1);
    final Map<dynamic, dynamic> headers = Map<String, String>.from(error.requestOptions.headers);
    final Map<dynamic, dynamic> query =
        Map<String, String>.from(error.requestOptions.queryParameters);
    final String? contentType = error.requestOptions.contentType;
    final String method = error.requestOptions.method.toUpperCase();
    final dynamic body = error.requestOptions.data;
      CustomAlertDialog(
          dismissible: false,
          alertIcon: const Icon(
            Icons.logout,
            color: primaryColor,
            size: 50,
          ),
          title: tr('Bad request'),
          button1String: tr("Retry"),
          button1OnTap: () async {
            Navigator.maybePop(globalKey.currentContext!);
            if (method == 'GET') {
              await apiConnection.get(url,
                  headers: headers as Map<String, String>,
                  contentType: contentType,
                  query: query as Map<String, dynamic>);
            } else {
              await apiConnection.post(
                url,
                FormData.fromMap(body as Map<String, dynamic>),
                contentType: contentType!,
                headers: headers as Map<String, String>,
                query: query as Map<String, dynamic>,
              );
            }
          },
          button2String: tr('Cancel'),
          button2OnTap: () async {
            Navigator.maybePop(globalKey.currentContext!);
          });
    }
  }

  void show500Dialog(DioError error) {
    final APIConnection apiConnection = APIConnection();
    final String url = error.requestOptions.path.substring(error.requestOptions.baseUrl.length + 1);
    final Map<dynamic, dynamic> headers = Map<String, String>.from(error.requestOptions.headers);
    final Map<dynamic, dynamic> query =
        Map<String, String>.from(error.requestOptions.queryParameters);
    final String? contentType = error.requestOptions.contentType;
    final String method = error.requestOptions.method.toUpperCase();
    final dynamic body = error.requestOptions.data;

      CustomAlertDialog(
          title: tr('Server Error'),
          button1String: "Retry",
          button1OnTap: () async {
            Navigator.maybePop(globalKey.currentContext!);
            if (method == 'GET') {
              await apiConnection.get(url,
                  headers: headers as Map<String, String>,
                  contentType: contentType,
                  query: query as Map<String, dynamic>);
            } else {
              await apiConnection.post(
                url,
                body as FormData,
                contentType: contentType!,
                headers: headers as Map<String, String>,
                query: query as Map<String, dynamic>,
              );
            }
          },
          button2String: tr('tryLater'));
    }

  void show401Dialog() {
        CustomAlertDialog(
            dismissible: false,
            isTwoButtons: false,
            button1String: '',
            button1OnTap: null,
            alertIcon: const Icon(
              Icons.logout,
              color: primaryColor,
              size: 50,
            ),
            title: tr('Unauthorized'),
            button2String: tr('Logout'),
            button2OnTap: () async {
            });
  }

  void show404Dialog() {
    try {
        CustomAlertDialog(
            dismissible: false,
            alertIcon: const Icon(
              Icons.logout,
              color:primaryColor,
              size: 50,
            ),
            title: tr('Server Error'),
            isTwoButtons: false,
            button1String: '',
            button1OnTap: null,
            button2OnTap: () {
              Navigator.maybePop(globalKey.currentContext!);
            },
            button2String: 'Cancel');
    }  catch (e) {
      ///
    }
  }

  void showTimeOutDialog(DioError error) {
    final APIConnection apiConnection = APIConnection();
    final String url = error.requestOptions.path.substring(error.requestOptions.baseUrl.length + 1);
    final Map<String, String> headers = Map<String, String>.from(error.requestOptions.headers);
    final Map<String, String> query =
        Map<String, String>.from(error.requestOptions.queryParameters);
    final String? contentType = error.requestOptions.contentType;
    final String method = error.requestOptions.method.toUpperCase();
    final dynamic body = error.requestOptions.data;
      CustomAlertDialog(
          dismissible: false,
          alertIcon: const Icon(
            Icons.logout,
            color: primaryColor,
            size: 50,
          ),
          title: tr('internet'),
          button1String: tr("Retry"),
          button1OnTap: () async {
            Navigator.maybePop(globalKey.currentContext!);
            if (method == 'GET') {
              await apiConnection.get(
                url,
                headers: headers,
                contentType: contentType,
                query: query,
              );
            } else {
              await apiConnection.post(
                url,
                FormData.fromMap(body as Map<String, dynamic>),
                contentType: contentType!,
                headers: headers,
                query: query,
              );
            }
          },
          button2String: tr('Cancel'),
          button2OnTap: () async {
    Navigator.maybePop(globalKey.currentContext!);
          });

}
