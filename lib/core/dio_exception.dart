import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.other:
        message = "connection failed due to internet connection";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  String? message;
  String _handleError(int statuscode, dynamic error) {
    switch (statuscode) {
      case 400:
        return error["message"] ?? error["sucess"] ?? "Error";

      case 401:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 409:
        return error["message"] ?? "Error";
      case 422:
        return error["message"] ?? "Something went Wrong";
      case 500:
        return "Internet server error";
      default:
        return "Something went worng";
    }
  }
}
