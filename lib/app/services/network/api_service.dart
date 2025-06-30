import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:project_counselling/app/models/apimodel/ChatRequest.dart';
import 'package:project_counselling/app/models/apimodel/ChatResponse.dart';
import 'package:project_counselling/app/services/network/callback.dart';
import 'package:project_counselling/app/services/network/dio_client.dart';
import 'package:project_counselling/app/services/network/exeption_handler.dart';

class ApiService {
  final DioClient _dioClient;
  final Dio _dio; // Get the Dio instance directly for cleaner calls

  ApiService(this._dioClient) : _dio = _dioClient.dio;

  // Future<void> testConnection({
  //   required TestConnectionRequest request,
  //   required ApiResponse<TestConnectionResponse> callback,
  // }) async {
  //   await handleDioCall<TestConnectionResponse>(
  //     apiCall: _dio.post(
  //       "/payrillium/local/test", // Actual API endpoint
  //       data: request.toJson(),
  //     ),
  //     callback: callback,
  //     parser: (data) => TestConnectionResponse.fromJson(data),
  //   );
  // }

  // --- NEW FUNCTION FOR CHAT API ---
  Future<void> sendChatMessage({
    required ChatRequest request,
    required ApiResponse<ChatResponse> callback,
  }) async {
    debugPrint("json of the request : ${request.toJson()}");
    await handleDioCall<ChatResponse>(
      apiCall: _dio.post(
        "/chat", // This will correctly combine with ApiConstants.BASE_URL
        data: request.toJson(),
        options: Options( // <--- ADD THIS OPTIONS PARAMETER
          contentType: Headers.jsonContentType, // <--- Set Content-Type here
        ),
      ),
      callback: callback,
      parser: (data) => ChatResponse.fromJson(data),
    );
  }
  
}