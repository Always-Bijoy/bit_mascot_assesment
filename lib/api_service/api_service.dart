import 'package:dio/dio.dart';
import 'package:erp/utils/app_const.dart';
import 'package:flutter/foundation.dart';

String errorMessage = '';

class ApiService {
  static Dio? _dio;

  static Dio? getDio() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: AppConst.baseUrlApi,
          headers: {Headers.contentTypeHeader: Headers.jsonContentType});

      _dio = Dio(options);

      _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
        if (kDebugMode) {
          print('Base Url : ${options.baseUrl}');
          print('End Point : ${options.path}');
          print('Method : ${options.method}');
          print('Data : ${options.data}');
        }

          options.headers = {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            // 'Authorization': "${AppConst.bearerToken} $token",
            'X-Requested-With': 'XMLHttpRequest',
            'Accept-Language': 'en',
        };
        return handler.next(options);
      }, onResponse: (response, handler) {
        if (kDebugMode) {
          print('response data : ${response.data}');
        }
        return handler.next(response);
      }, onError: (DioException e, handler) {
        if (kDebugMode) {
          print('Error Response : ${e.response}');
          print('Error message : ${e.message}');
          print('Error type : ${e.type.name}');
        }
        errorMessage = DioExceptions.fromDioError(e).toString();
        return handler.next(e);
      }));
    }
    return _dio;
  }
}

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 302:
        return error["message"];
      case 400:
        return error["message"];
      case 404:
        return error["message"];
      case 422:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}

