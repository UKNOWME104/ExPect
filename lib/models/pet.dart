// models/pet.dart
class Pet {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String medicalHistory;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.medicalHistory,
  });

  // Factory method to create a Pet from a map (for Firebase or database)
  factory Pet.fromMap(Map<String, dynamic> map, String id) {
    return Pet(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      breed: map['breed'] ?? '',
      age: map['age'] ?? 0,
      medicalHistory: map['medicalHistory'] ?? '',
    );
  }

  // Convert the Pet object to a map (for Firebase or database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'breed': breed,
      'age': age,
      'medicalHistory': medicalHistory,
    };
  }

  // CopyWith method to create a new Pet object with updated fields
  Pet copyWith({
    String? id,
    String? name,
    String? breed,
    int? age,
    String? medicalHistory,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      medicalHistory: medicalHistory ?? this.medicalHistory,
    );
  }
}
