import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatRequest.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatResponse.dart';
import 'package:project_counselling/app/data/models/apimodel/chat_message.dart';
import 'package:project_counselling/app/data/enums/chat_users.dart';
import 'package:project_counselling/app/data/enums/language.dart' as languageEnum;
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/data/services/local/LocalResponse.dart';
import 'package:project_counselling/app/data/services/network/ApiService.dart';
import 'package:project_counselling/app/data/services/network/callback.dart';
import 'package:project_counselling/app/data/enums/failstate.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';

class SpeechController extends GetxController {
  final FlutterTts tts = FlutterTts();
  final stt.SpeechToText sttEngine = stt.SpeechToText();

  var isListening = false.obs;
  var isSpeaking = false.obs;
  var speechTimedOut = false.obs;
  var isThinking = false.obs;
  RxList<ChatMessage> messageList = <ChatMessage>[].obs;
  late final languageEnum.Language language;
  final String _apiKey = "AIzaSyBxBD_YakcWIokmkJvJwqv8YkqEAaLFpUQ";
  final ApiService _apiService = Get.find<ApiService>();
  late GenerativeModel _model;

  final String _systemPrompt = """
        You are a compassionate, empathetic, and non-judgemental AI assistant designed to provide supportive listening and general guidance in a counseling context. Your purpose is to offer a safe space for users to express themselves and explore their feelings.

        **Key Principles to Adhere To:**
        1.  **Empathy and Understanding:** Respond with genuine understanding and validate the user's emotions.
        2.  **Active Listening:** Reflect back what the user says to show you're listening and to clarify understanding.
        3.  **Non-Judgmental:** Maintain a neutral, accepting, and non-critical stance at all times.
        4.  **Supportive Guidance:** Offer general perspectives, coping strategies, or thought-provoking questions to help users explore their own solutions, but never give direct advice or make decisions for them.
        5.  **Focus on Feelings:** Encourage emotional expression and help users articulate their feelings.
        6.  **Safety First:** If a user expresses intent to harm themselves or others, or if they describe child abuse or severe mental health crises that require immediate professional intervention, you *must* gently redirect them to seek immediate human professional help (e.g., a crisis hotline, emergency services, or a licensed therapist). **Crucially, you are not a human professional and cannot provide medical, psychological, or legal advice.**

        **Tone & Style:**
        * Calm, reassuring, and warm.
        * Respectful and humble.
        * Conversational and natural, avoiding overly academic or robotic language.
        * Concise, generally aiming for 2-4 sentences per response unless more detail is specifically requested or necessary for empathy.

        **Constraint:**
        * **You are an AI.** Always remember and convey this limitation implicitly or explicitly when appropriate, especially when discussing sensitive topics or professional advice. Do not impersonate a human therapist.
        * Avoid using jargon.
        * Do not diagnose conditions.
        * Do not offer prescriptions or medical advice.
        * Do not provide legal advice.

        **Your initial response should gently invite the user to share what's on their mind.**
    """;

  @override
  void onInit() {
    super.onInit();
    // Safe default assignment
    language = Get.arguments ?? languageEnum.Language.ENGLISH;
    debugPrint("Start Covo in ${language.toLanguageSign()}");
    init();
    debugPrint("LLMController initialized.");
    _initializeGenerativeModel(); // NEW: Initialize the model
  }

  Future<void> init() async {
    await tts.setLanguage(language.toLanguageSign());
    await tts.setPitch(0.9);
    await tts.setSpeechRate(0.7);

    tts.setCompletionHandler(() {
      isSpeaking.value = false;
      speechTimedOut.value = true;
      startListening();
    });

    bool available = await sttEngine.initialize(
      onStatus: (status) {
        if (status == "done" && !isSpeaking.value) {
          isListening.value = false;
        }
      },
      onError: (err) {
        print("Speech error: $err");
        isListening.value = false;
        speechTimedOut.value = true;
      },
    );

    if (available) {
      startListening();
    }
  }

  void startListening() {
    if (isListening.value || isSpeaking.value) return;

    speechTimedOut.value = false;
    sttEngine.listen(
      onResult: (result) async {
        if (result.finalResult && result.recognizedWords.isNotEmpty) {
          isListening.value = false;
          await sttEngine.stop();
          addMessage(
            ChatMessage(
              user: ChatUser.user,
              text: result.recognizedWords,
            ),
          );
          await speak(result.recognizedWords);
        }
      },
      listenMode: stt.ListenMode.dictation,
      partialResults: false,
      cancelOnError: false,
      localeId: language.toLanguageSign(),
      pauseFor: Duration(seconds: 4),
    );
    isListening.value = true;
  }

  Future<void> speak(String text) async {
    isThinking.value = true;
    debugPrint(text);

    var response = getCounsellorResponse(
      text,
    ); // assuming this returns Future<String?>

    if (response != null) {
      isThinking.value = false;
      isSpeaking.value = true;
      addMessage(
        ChatMessage(
          user: ChatUser.assistant,
          text: response,
        ),
      );
      await tts.speak(response);
    } else {
      response = await sendUserMessage(text);
      isThinking.value = false;
      isSpeaking.value = true;
      addMessage(
        ChatMessage(
          user: ChatUser.assistant,
          text: response,
        ),
      );
      await tts.speak(response);
    }
  }

  void retryListeningManually() {
    speechTimedOut.value = false;
    startListening();
  }

  @override
  void onClose() {
    sttEngine.stop();
    tts.stop();
    super.onClose();
  }

  void navigateToChat() {
    Get.toNamed(Routes.USER_CHAT, arguments: messageList.toList());
  }

  void addMessage(ChatMessage message) {
    messageList.add(message);
  }

  final llmResponse = ''.obs; // The AI's response text
  final llmError = ''.obs; // Any error from the AI API call

  // Your API key for the Gemini API.
  // In a real app, manage this securely (e.g., using environment variables).
  // For this Canvas environment, leaving it empty typically means it's injected.

  void _initializeGenerativeModel() {
    if (_apiKey.isEmpty) {
      debugPrint(
        "LLM: Warning: API Key is empty. Ensure it's set or injected.",
      );
      // You might want to show an error or disable LLM features if API key is not available
      llmError.value = "Gemini API Key is not configured.";
    }
    // NEW: Initialize the GenerativeModel client
    _model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: _apiKey);
    sendMessageToLLM(_systemPrompt);
  }

  /// Sends a message to the Gemini API and updates reactive state.
  Future<String> sendMessageToLLM(String userMessage) async {
    if (userMessage.trim().isEmpty) {
      debugPrint('LLM: User message is empty, not sending to LLM.');
      llmResponse.value = 'Please say something to start the conversation.';
      return "I can't understand your voice can you please repeat.";
    }
    if (_apiKey.isEmpty) {
      llmError.value = "Gemini API Key is not configured. Cannot send message.";
      return "Something went wrong please try after some time.";
    }

    llmError.value = '';
    llmResponse.value = ''; // Clear previous response

    debugPrint('LLM: Sending message to LLM: "$userMessage"');

    try {
      // NEW: Create content for the model
      final content = [
        Content.text("${userMessage}You are a compassionate and thoughtful counselling assistant trained to support users with emotional well-being, stress management, motivation, and personal development. You should listen actively, ask reflective questions, and guide the user to think positively and constructively. Do not give medical or clinical advice or diagnose conditions. Always respond with empathy, calmness, and encouragement. Keep your tone warm, supportive, and human-like. If a user is in crisis, gently recommend seeking help from a real-life professional or helpline."),
      ];

      // NEW: Generate content using the GenerativeModel
      final response = await _model.generateContent(content);

      if (response.text != null && response.text!.isNotEmpty) {
        llmResponse.value = response.text!;
        debugPrint('LLM: AI Response: "${response.text!}"');
        return response.text!;
      } else {
        llmError.value = 'LLM: No text response from Gemini API.';
        debugPrint('LLM: Gemini API response was empty or malformed.');
        return "I don't have any word to say";
      }
      
    } on GenerativeAIException catch (e) {
      // NEW: Catch specific AI exceptions
      llmError.value = 'LLM API Error: ${e.message}';
      debugPrint('LLM API Error: ${e.message}');
      return "Something went wrong please try after some time.";
    } catch (e) {
      llmError.value = 'LLM: Network/Unexpected Error: $e';
      debugPrint('LLM: Network/Unexpected Error: $e');
      return "Something went wrong please try after some time.";
    }
  }

  Future<String> sendUserMessage(String userContent) async {
    // 1. Handle empty input immediately
    if (userContent.trim().isEmpty) {
      return "";
    }

    // Indicate that the AI is thinking (for UI updates)
    isThinking.value = true;
    // errorMessage.value = ''; // Uncomment if you want to clear previous errors here

    // 2. Add user's message to the conversation history (assuming ChatMessage is your display model)
    // If messageList is your source of truth for ChatRequest, ensure it holds `Message` objects
    // and convert from ChatMessage for API, or vice-versa for display.
    // Assuming `addMessage` adds to a list that `messageList` reflects, or `messageList` directly stores `Message`.
    // For the API call, we need `List<Message>`, so ensure `messageList` is of `Message` type.

    // 3. Prepare the ChatRequest with the current conversation history
    final chatRequest = ChatRequest(messages: messageList.toList());

    // 4. Initialize a Completer to manage the Future's completion
    final Completer<String> completer = Completer<String>();

    // 5. Make the API call using your ApiService
    await _apiService.sendChatMessage(
      request: chatRequest,
      callback: ApiCallback<ChatResponse>( // Use your concrete implementation here
        onSuccessCallback: (response) {
          // Add the assistant's response to the conversation history (for UI display)
          // Ensure `addMessage` is correctly defined and adds to your display list.
          // If messageList is your display list, add the Message directly;
          completer.complete(response.responseContent); // COMPLETE the Future with the AI's response
        },
        onFailureCallback: (errorMsg, responseData, {FailedState? failAPIState}) {
        
          completer.complete(""); // COMPLETE the Future with an empty string on failure
        },
      ),
    );
    return completer.future;
  }
}
