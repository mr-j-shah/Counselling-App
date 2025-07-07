import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:project_counselling/app/constants/ApiEndpoints.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatRequest.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatResponse.dart';
import 'package:project_counselling/app/data/services/network/ApiImpl.dart';
import 'package:project_counselling/app/data/services/network/callback.dart';
import 'package:project_counselling/app/data/services/network/dio_client.dart';
import 'package:project_counselling/app/data/services/network/exeption_handler.dart';

class ApiService implements ApiImpl {
  final DioClient _dioClient;
  final Dio _dio;

  ApiService(this._dioClient) : _dio = _dioClient.dio;

  @override
  Future<void> sendChatMessage({
    required ChatRequest request,
    required ApiResponse<ChatResponse> callback,
  }) async {
    debugPrint("json of the request : ${request.toJson()}");
    await handleDioCall<ChatResponse>(
      apiCall: _dio.post(
        Apiendpoints.chat,
        data: request.toJson(),
        options: Options(contentType: Headers.jsonContentType),
      ),
      callback: callback,
      parser: (data) => ChatResponse.fromJson(data),
    );
  }
}
