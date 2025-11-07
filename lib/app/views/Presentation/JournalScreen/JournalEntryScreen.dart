import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/controller/JournalController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class JournalEntryScreen extends StatefulWidget {
  final JournalEntry? entry;

  const JournalEntryScreen({super.key, this.entry});

  @override
  _JournalEntryScreenState createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  final JournalController _journalController = Get.find();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  double _currentMood = 5;

  late stt.SpeechToText _speech;
  bool _isListening = false;

  final List<String> _moodEmojis = [
    '😔', // 1
    '😟', // 2
    '😕', // 3
    '😐', // 4
    '🙂', // 5
    '😊', // 6
    '😄', // 7
    '😁', // 8
    '🤩', // 9
    '😍'  // 10
  ];

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _titleController = TextEditingController(text: widget.entry?.title ?? '');
    _contentController = TextEditingController(text: widget.entry?.content ?? '');
    _currentMood = widget.entry?.mood.toDouble() ?? 5.0;
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _contentController.text = val.recognizedWords;
          }),
        );
      } else {
        print("The user has denied the use of speech recognition.");
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                title: widget.entry == null ? "New Journal Entry" : "Edit Journal Entry",
                // Add a delete button for existing entries
                suffixAction: widget.entry != null
                    ? IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () {
                          // Show confirmation dialog before deleting
                          Get.defaultDialog(
                              title: "Delete Entry",
                              middleText: "Are you sure you want to delete this journal entry?",
                              textConfirm: "Delete",
                              textCancel: "Cancel",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                _journalController.deleteJournalEntry(widget.entry!.id!);
                                Get.back(); // Close dialog
                                Get.back(); // Go back from entry screen
                              });
                        },
                      )
                    : null,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.padding(20)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title TextField
                        const AppText(text: "Title", fontWeight: FontWeight.bold),
                        SizedBox(height: Dimensions.height(8)),
                        TextField(
                          controller: _titleController,
                          decoration: _inputDecoration("What's on your mind?"),
                        ),
                        SizedBox(height: Dimensions.height(24)),
                        // Content TextField
                        const AppText(text: "Content", fontWeight: FontWeight.bold),
                        SizedBox(height: Dimensions.height(8)),
                        TextField(
                          controller: _contentController,
                          decoration: _inputDecoration("Describe your feelings..."),
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(height: Dimensions.height(24)),

                        // Mood Selector
                        const AppText(text: "How are you feeling?", fontWeight: FontWeight.bold),
                        SizedBox(height: Dimensions.height(16)),
                        Center(
                          child: AppText(
                            text: _moodEmojis[(_currentMood - 1).round()],
                            fontSize: 40,
                          ),
                        ),
                        Slider(
                          value: _currentMood,
                          min: 1,
                          max: 10,
                          divisions: 9,
                          label: _currentMood.round().toString(),
                          activeColor: primaryColor,
                          inactiveColor: primaryColor.withOpacity(0.3),
                          onChanged: (double value) {
                            setState(() {
                              _currentMood = value;
                            });
                          },
                        ),
                        SizedBox(height: Dimensions.height(32)),

                        // Save Button
                        PrimaryButton(
                          text: 'Save Entry',
                          onPressed: () {
                            if (_titleController.text.isEmpty && _contentController.text.isEmpty) {
                              Get.snackbar(
                                "Empty Entry",
                                "Please write a title or content for your journal entry.",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              return;
                            }
                            final newEntry = JournalEntry(
                              id: widget.entry?.id,
                              title: _titleController.text.isEmpty ? "Untitled" : _titleController.text,
                              content: _contentController.text,
                              mood: _currentMood.round(),
                              timestamp: DateTime.now(),
                            );
                            if (widget.entry == null) {
                              _journalController.addJournalEntry(newEntry);
                            } else {
                              _journalController.updateJournalEntry(newEntry);
                            }
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _listen,
        backgroundColor: primaryColor,
        child: Icon(
          _isListening ? Icons.mic : Icons.mic_none,
          color: Colors.white,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.padding(16),
        vertical: Dimensions.padding(12),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(12)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(12)),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
    );
  }
}
