import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/constants/AppAssets.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/controller/ChatHistoryController.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/widgets/ChatHistoryShimmer.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/widgets/DeleteChatDialog.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class ChatHistoryScreen extends GetView<ChatHistoryController> {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "My Sessions"),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const ChatHistoryShimmer();
                  }
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: AppText(
                        text: controller.errorMessage.value,
                        align: TextAlign.center,
                      ),
                    );
                  }
                  if (controller.chatHistories.isEmpty) {
                    return _buildEmptyState();
                  }
                  return RefreshIndicator(
                    onRefresh: controller.fetchChatHistories,
                    child: ListView.builder(
                      padding: EdgeInsets.all(Dimensions.padding(16)),
                      itemCount: controller.chatHistories.length,
                      itemBuilder: (context, index) {
                        final history = controller.chatHistories[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                              vertical: Dimensions.height(8)),
                          elevation: 3,
                          shadowColor: Colors.black.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius(12)),
                          ),
                          child: InkWell(
                            onTap: () =>
                                controller.navigateToChatDetail(history),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius(12)),
                            child: Padding(
                              padding: EdgeInsets.all(Dimensions.padding(16)),
                              child: Row(
                                children: [
                                  Container(
                                    width: Dimensions.width(60),
                                    height: Dimensions.height(60),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius(12)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          text: DateFormat('dd')
                                              .format(history.timestamp.toDate()),
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        AppText(
                                          text: DateFormat('MMM')
                                              .format(history.timestamp.toDate())
                                              .toUpperCase(),
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width(16)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: history.title,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: Dimensions.height(4)),
                                        if (history.avatar != null)
                                          AppText(
                                            text:
                                                "Session with ${history.avatar!.name}",
                                            color: Colors.grey.shade600,
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width(10)),
                                  PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'delete') {
                                        showDeleteChatDialog(context,
                                            onConfirm: () => controller
                                                .deleteChatHistory(history.id));
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete_outline_rounded,
                                                color: Colors.redAccent),
                                            SizedBox(width: 8),
                                            Text('Delete'),
                                          ],
                                        ),
                                      ),
                                    ],
                                    child: Icon(Icons.more_vert,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(Dimensions.padding(50)),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  Appassets.empty_my_session,
                  width: Dimensions.width(150),
                  height: Dimensions.height(150),
                ),
              )),
          SizedBox(height: Dimensions.height(12)),
          const AppText(
            text: "No sessions saved yet",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: Dimensions.height(8)),
          const AppText(
            text: "Start a new session to save your thoughts.",
            color: Colors.grey,
          ),
          SizedBox(height: Dimensions.height(24)),
          PrimaryButton(
            text: "Start New Session",
            onPressed: controller.startNewSession,
          ),
        ],
      ),
    );
  }
}
