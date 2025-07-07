import 'package:project_counselling/app/data/models/apimodel/ChatRequest.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatResponse.dart';
import 'package:project_counselling/app/data/services/network/callback.dart';

abstract class ApiImpl {
  Future<void> sendChatMessage({
    required ChatRequest request,
    required ApiResponse<ChatResponse> callback,
  });
}
