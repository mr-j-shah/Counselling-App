import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry entry;

  JournalEntryCard({super.key, required this.entry});

  // Helper to get a color based on mood
  Color _getMoodColor(int mood) {
    if (mood <= 3) return Colors.blue.shade300;
    if (mood <= 6) return Colors.green.shade300;
    return Colors.orange.shade300;
  }

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

  // Helper to get an emoji based on mood
  String _getMoodEmoji(int mood) {
    return _moodEmojis[(mood - 1).round()];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(15)),
      ),
      child: Row(
        children: [
          // Side panel for date and mood color
          Container(
            width: Dimensions.width(70),
            padding: EdgeInsets.symmetric(vertical: Dimensions.padding(16)),
            decoration: BoxDecoration(
              color: _getMoodColor(entry.mood).withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius(15)),
                bottomLeft: Radius.circular(Dimensions.radius(15)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: DateFormat('MMM').format(entry.timestamp).toUpperCase(),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: Dimensions.height(4)),
                AppText(
                  text: DateFormat('dd').format(entry.timestamp),
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Dimensions.padding(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                          text: entry.title,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      AppText(
                        text: _getMoodEmoji(entry.mood),
                        fontSize: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height(8)),
                  AppText(
                    text: entry.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
