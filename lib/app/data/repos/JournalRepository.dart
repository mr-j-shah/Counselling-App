import 'package:project_counselling/app/data/provider/db/DatabaseHelper.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';

class JournalRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> addJournalEntry(JournalEntry entry) {
    return _dbHelper.addJournalEntry(entry);
  }

  Future<List<JournalEntry>> getJournalEntries() {
    return _dbHelper.getJournalEntries();
  }

  Future<int> updateJournalEntry(JournalEntry entry) {
    return _dbHelper.updateJournalEntry(entry);
  }

  Future<int> deleteJournalEntry(int id) {
    return _dbHelper.deleteJournalEntry(id);
  }
}
