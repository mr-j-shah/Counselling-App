import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/ChatHistory.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/repos/ChatRepo.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

class ChatHistoryController extends GetxController {
  final ChatRepo _chatRepo = ChatRepo();
  final AppPref _appPref = Get.find<AppPref>();

  final RxList<ChatHistory> chatHistories = <ChatHistory>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatHistories();
  }

  Future<void> fetchChatHistories() async {
    final user = _appPref.getUser();
    if (user == null) {
      errorMessage.value = "You need to be logged in to see your chat history.";
      isLoading.value = false;
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      final histories = await _chatRepo.getChatHistories(user.userID);
      chatHistories.value = histories;
    } catch (e) {
      errorMessage.value = "Failed to load chat history.";
      print("Error fetching chat histories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToChatDetail(ChatHistory history) {
    Get.toNamed(Routes.CHAT_HISTORY_DETAIL_SCREEN, arguments: history);
  }
}
