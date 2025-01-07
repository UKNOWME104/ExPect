// models/medication.dart

class Medication {
  final String id; // Unique ID for the medication
  final String name;
  final String dose;
  final String time; // Time for the medication reminder

  Medication({
    required this.id,
    required this.name,
    required this.dose,
    required this.time,
  });

  // Convert Medication object to Map for Firestore or API
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dose': dose,
      'time': time,
    };
  }

  // Convert Map to Medication object
  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      dose: map['dose'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
