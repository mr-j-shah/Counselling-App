import 'package:get/get.dart';
import 'package:project_counselling/app/data/repos/JournalRepository.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';

class JournalController extends GetxController {
  final JournalRepository _journalRepository = JournalRepository();

  var journalEntries = <JournalEntry>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJournalEntries();
  }

  void fetchJournalEntries() async {
    try {
      isLoading(true);
      journalEntries.value = await _journalRepository.getJournalEntries();
    } finally {
      isLoading(false);
    }
  }

  void addJournalEntry(JournalEntry entry) async {
    await _journalRepository.addJournalEntry(entry);
    fetchJournalEntries(); // Refresh the list
  }

  void updateJournalEntry(JournalEntry entry) async {
    await _journalRepository.updateJournalEntry(entry);
    fetchJournalEntries(); // Refresh the list
  }

  void deleteJournalEntry(int id) async {
    await _journalRepository.deleteJournalEntry(id);
    fetchJournalEntries(); // Refresh the list
  }
}
