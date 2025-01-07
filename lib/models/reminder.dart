class Reminder {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String petId;

  Reminder({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.petId,
  });

  // Convert a Reminder object to a Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'petId': petId,
    };
  }

  // Create a Reminder object from a Firestore document map
  factory Reminder.fromMap(Map<String, dynamic> map, String documentId) {
    return Reminder(
      id: documentId,
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      petId: map['petId'],
    );
  }
}
