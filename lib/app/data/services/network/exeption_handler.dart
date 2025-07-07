import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // For debugPrint, kDebugMode// Adjust import path
import 'callback.dart';
import '../../enums/failstate.dart';

Future<void> handleDioCall<T>(
    {required Future<Response<dynamic>> apiCall,
    required ApiResponse<T> callback,
    required T Function(dynamic data) parser}) async {
  try {
    final response = await apiCall;

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final parsedData = parser(response.data);
        callback.onSuccess(parsedData);
      } catch (e) {
        debugPrint('Failed to parse response data: $e');
        callback.onFailure(
          "Failed to process server response.",
          response.data?.toString(),
          failAPIState: FailedState.DATA_PARSE_ERROR,
        );
      }
    } else {
      // Handle non-2xx HTTP status codes
      debugPrint('API call failed with status: ${response.statusCode}');
      FailedState specificState = FailedState.SERVER_ERROR;
      switch (response.statusCode) {
        case 400: specificState = FailedState.BAD_REQUEST; break;
        case 401: specificState = FailedState.UNAUTHORIZED; break;
        case 403: specificState = FailedState.FORBIDDEN; break;
        case 404: specificState = FailedState.NOT_FOUND; break;
        case 409: specificState = FailedState.CONFLICT; break;
        case 500: 
        case 502:
        case 503: specificState = FailedState.INTERNAL_SERVER_ERROR; break;
      }

      callback.onFailure(
        "Server error: ${response.statusCode}",
        response.data?.toString(),
        failAPIState: specificState,
      );
    }
  } on DioException catch (e) {
    // Handle Dio-specific errors
    debugPrint('DioException: ${e.type} - ${e.message}');
    String? responseData = e.response?.data?.toString();
    String errorMessage = "An unknown network error occurred.";
    FailedState failState = FailedState.UNKNOWN_ERROR;

    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        errorMessage ="Please check your internet connection.";
        failState = FailedState.NETWORK_ERROR;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Failed to send request, timeout.";
        failState = FailedState.NETWORK_ERROR;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Failed to receive response, timeout.";
        failState = FailedState.NETWORK_ERROR;
        break;
      case DioExceptionType.badResponse:
        errorMessage = "Server returned an error: ${e.response?.statusCode}.";
        // Try to parse more specific error if available in response.data
        if (e.response?.data is Map && e.response?.data.containsKey('message')) {
          errorMessage = e.response!.data['message'];
        }
        failState = FailedState.SERVER_ERROR;
        break;
      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled.";
        failState = FailedState.NONE; // Not a failure, but cancelled
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "SSL certificate error.";
        failState = FailedState.NETWORK_ERROR;
        break;
      case DioExceptionType.unknown:
      errorMessage = "An unexpected error occurred: ${e.message ?? 'Unknown error'}.";
        failState = FailedState.UNKNOWN_ERROR;
        break;
    }
    callback.onFailure(errorMessage, responseData, failAPIState: failState);
  } catch (e) {
    // Handle any other unexpected errors
    debugPrint('Unexpected error: $e');
    callback.onFailure(
      "An unexpected application error occurred.",
      e.toString(),
      failAPIState: FailedState.UNKNOWN_ERROR,
    );
  }
}