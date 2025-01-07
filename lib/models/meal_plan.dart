// models/meal_plan.dart
class MealPlan {
  final String id;
  final String meal;
  final DateTime time;

  MealPlan({
    required this.id,
    required this.meal,
    required this.time,
  });

  // Factory method to create a MealPlan from a map (for Firebase or database)
  factory MealPlan.fromMap(Map<String, dynamic> map) {
    return MealPlan(
      id: map['id'] ?? '',
      meal: map['meal'] ?? '',
      time: DateTime.parse(map['time'] ?? DateTime.now().toString()),
    );
  }

  // Convert the MealPlan object to a map (for Firebase or database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'meal': meal,
      'time': time.toIso8601String(),
    };
  }
}
