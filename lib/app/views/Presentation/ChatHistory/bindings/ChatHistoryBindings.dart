import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/controller/ChatHistoryController.dart';

class ChatHistoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatHistoryController>(() => ChatHistoryController());
  }
}
