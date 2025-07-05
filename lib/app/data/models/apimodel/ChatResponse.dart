class ChatResponse {
  final String responseContent;

  ChatResponse({required this.responseContent});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      responseContent: json['response'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': responseContent,
    };
  }
}