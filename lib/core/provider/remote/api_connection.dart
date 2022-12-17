import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../global_bloc/app_bloc.dart';
import '../../widget/message.dart';
import '../../widget/my_dialog.dart';
import 'api_endpoints.dart';
import 'dio_interceptor.dart';

class APIConnection {
  bool showMessage = true;
  final Dio _dio = Dio();

  APIConnection() {
    {
      _dio.options.baseUrl = EndPoint.baseUrl;
      _dio.options.followRedirects = false;
      _dio.options.contentType = 'application/json';
      _dio.options.connectTimeout = 30000;
      _dio.options.receiveTimeout = 15000;

      _dio.options.setRequestContentTypeWhenNoPayload = true;
      _dio.interceptors.add(DioInterceptor());
    }
  }

  APIConnection._singleTone() {
    {
      _dio.options.baseUrl = EndPoint.baseUrl;
      _dio.options.followRedirects = false;
      _dio.options.contentType = 'application/json';
      _dio.options.connectTimeout = 30000;
      _dio.options.receiveTimeout = 15000;
      _dio.options.setRequestContentTypeWhenNoPayload = true;
      _dio.interceptors.add(DioInterceptor());
    }
  }

  static final APIConnection _instance = APIConnection._singleTone();

  static APIConnection get instance => _instance;

  Future<Response<dynamic>> get(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query}) async {
    if (await checkConnection()) {
      try {
        final Future<Response<dynamic>> r = _dio.get<dynamic>('${_dio.options.baseUrl}/$url',
            options: Options(headers: headers, contentType: contentType), queryParameters: query);
        r.then((Response<dynamic> value) async {
          if (value.statusCode == 401) {
            showDialog(value.data, url, null,
                contentType: contentType!, headers: headers!, query: query, isGet: true);
          }
          try {
            if (value.data!['success'].toString() == 'false') {
              showDialog(value.data!['errors'] as Map<String, dynamic>, url, null,
                  contentType: contentType!, headers: headers!, query: query, isGet: true);
            }
          } catch (_) {
            // TODO
          }
        });

        return r;
      } catch (e) {
        return Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(
                data: <String, dynamic>{'success': 'false', 'message': tr('Server Error')},
                path: ''));
      }
    } else {
      showDialog(<String, dynamic>{'connection': tr('internet')}, url, null,
          contentType: contentType!, headers: headers!, query: query, isGet: true);
    }
    //todo:
    return Response<Map<String, dynamic>>(requestOptions: RequestOptions(path: ''));
  }

  Future<Response<Map<String, dynamic>>> post(String path, FormData body,
      {String contentType = 'application/json',
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      bool? loading}) async {
    String url = '/$path';
    if (await checkConnection()) {
      url = url.startsWith('http') ? url : _dio.options.baseUrl + url;

      url = url.replaceAll('v1//', 'v1/');

      Response<Map<String, dynamic>>? res;
      try {
        await _dio
            .post<Map<String, dynamic>>(url,
                data: body,
                options: Options(
                  headers: headers,
                  followRedirects: false,
                  validateStatus: (int? status) {
                    return status! < 500;
                  },
                ),
                queryParameters: query)
            .then((Response<Map<String, dynamic>> value) async {
          res = value;
          if (res!.data!['success'] == false) {
            showDialog(
              res!.data!['errors'] as Map<String, dynamic>,
              url,
              body,
              contentType: contentType,
              headers: headers!,
              query: query,
              isGet: false,
            );
          }
        }).timeout(const Duration(seconds: 15), onTimeout: () {
          res = Response<Map<String, dynamic>>(
              requestOptions: RequestOptions(
                  data: <String, String>{'success': 'false', 'message': 'error'}, path: ''));
        });
      } catch (e) {
        return Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(
                data: <String, dynamic>{'success': 'false', 'message': ('Server Error')},
                path: ''));
      }
      return res!;
    } else {
      showDialog(
        <String, String>{'connection': tr('internet')},
        url,
        body,
        contentType: contentType,
        headers: headers!,
        query: query,
        isGet: false,
      );
      return Future<Response<Map<String, dynamic>>>.value(Response<Map<String, dynamic>>(
          requestOptions: RequestOptions(
              data: <String, dynamic>{'success': 'false', 'message': 'error'}, path: '')));
    }
  }

  ///-------------------check
  Future<bool> checkConnection() async {
    bool connectionStatus = true;
    try {
      await Connectivity().checkConnectivity().then((ConnectivityResult value) async {
        if (value == ConnectivityResult.mobile ||
            value == ConnectivityResult.wifi ||
            value == ConnectivityResult.none) {
          try {
            final List<InternetAddress> result = await InternetAddress.lookup('example.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              connectionStatus = true;
            } else {
              connectionStatus = false;
            }
          } on SocketException catch (_) {
            connectionStatus = false;
          }
        } else {
          connectionStatus = false;
        }
      });
    } catch (_) {
      connectionStatus = false;
    }
    return connectionStatus;
  }

  void showDialog(Map<String, dynamic>? res, String url, FormData? body,
      {required bool isGet,
      required String contentType,
      required Map<String, String> headers,
      required Map<String, dynamic>? query}) {
    if (showMessage) {
      try {
        final String statusCode = res!['status_code'];
        if (res.containsKey('connection')) {
          if (isGet) {
            CustomAlertDialog(
                title: res['connection'].toString(),
                button1String: "Retry",
                button1OnTap: () {
                  if (isGet) {
                    get(url, headers: headers, contentType: contentType, query: query);
                  } else {
                    post(
                      url,
                      body!,
                      contentType: contentType,
                      headers: headers,
                      query: query,
                    );
                  }
                  Navigator.maybePop(globalKey.currentContext!);
                },
                button2String: 'cancel');
          } else {
            MyToast(res['connection'].toString());
          }
        } else if (res.containsKey('Server Error')) {
          CustomAlertDialog(
              title: res['Server Error'].toString(),
              button1String: "Retry",
              button1OnTap: () {
                if (isGet) {
                  get(url, headers: headers, contentType: contentType, query: query);
                } else {
                  post(url, body!, contentType: contentType, headers: headers, query: query);
                }
                Navigator.maybePop(globalKey.currentContext!);
              },
              button2String: isGet ? null : 'tryLater');
        } else {
          MyToast(res.values.join(', '), isError: true);
        }
      } catch (e) {
        if (res != null) {
          MyToast(res.toString());
        } else {
          MyToast(tr('Server Error'));
        }
      }
    }
  }
}
