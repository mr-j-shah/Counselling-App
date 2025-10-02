class MedicalRecordModel {
  final String id;
  final String title; // e.g., "Records added by you"
  final String recordedFor; // e.g., "Abdullah mamun"
  final DateTime date;
  final String summary; // e.g., "1 Prescription"
  final bool isNew;

  MedicalRecordModel({
    required this.id,
    required this.title,
    required this.recordedFor,
    required this.date,
    required this.summary,
    this.isNew = false,
  });
}
