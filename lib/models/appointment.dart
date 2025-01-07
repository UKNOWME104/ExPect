// models/appointment.dart

class Appointment {
  final String id; // Unique ID for the appointment
  final String reason; // Reason for the vet appointment
  final DateTime dateTime; // Date and time of the appointment

  Appointment({
    required this.id,
    required this.reason,
    required this.dateTime,
  });

  // Convert Appointment object to Map for Firestore or API
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reason': reason,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  // Convert Map to Appointment object
  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] ?? '',
      reason: map['reason'] ?? '',
      dateTime: DateTime.parse(map['dateTime'] ?? DateTime.now().toString()),
    );
  }
}
