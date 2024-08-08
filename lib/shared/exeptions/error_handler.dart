import 'package:dio/dio.dart';
import 'package:interview_flutter/shared/exeptions/custom_exeptions.dart';

class ErrorHandler {
  static void handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw CustomException(
            'Connection Timeout: Please check your internet connection.',
            code: DioExceptionType.connectionTimeout.index);

      case DioExceptionType.sendTimeout:
        throw CustomException(
            'Send Timeout: The request took too long to send.',
            code: DioExceptionType.sendTimeout.index);
      case DioExceptionType.receiveTimeout:
        throw CustomException(
            'Receive Timeout: The server took too long to respond.',
            code: DioExceptionType.receiveTimeout.index);
      case DioExceptionType.badResponse:
        _handleResponseError(e);
        break;
      case DioExceptionType.cancel:
        throw CustomException('Request Cancelled: The request was cancelled.',
            code: DioExceptionType.cancel.index);
      case DioExceptionType.unknown:
        throw CustomException(
            'No Internet Connection: Please check your internet connection.',
            code: DioExceptionType.unknown.index);
      default:
        throw CustomException('An unexpected error occurred: ${e.message}');
    }
  }

  static void _handleResponseError(DioException e) {
    if (e.response?.statusCode == 503) {
      throw CustomException(
          'Service Unavailable: The allowed number of requests has been exceeded.',
          code: 503);
    } else if (e.response?.statusCode == 404) {
      throw CustomException(
          'Not Found: The requested resource could not be found.',
          code: 404);
    } else if (e.response?.statusCode == 500) {
      throw CustomException('Internal Server Error: Please try again later.',
          code: 500);
    } else {
      throw CustomException('An unexpected server error occurred: ${e.message}',
          code: e.response?.statusCode);
    }
  }
}
