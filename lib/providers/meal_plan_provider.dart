import 'package:flutter/material.dart';
import '../models/meal_plan.dart';

class MealPlanProvider with ChangeNotifier {
  List<MealPlan> _mealPlans = [];

  List<MealPlan> get mealPlans => List.unmodifiable(_mealPlans);

  void addMealPlan(MealPlan mealPlan) {
    _mealPlans.add(mealPlan);
    notifyListeners();
  }

  void updateMealPlan(int index, MealPlan updatedMealPlan) {
    if (index >= 0 && index < _mealPlans.length) {
      _mealPlans[index] = updatedMealPlan;
      notifyListeners();
    }
  }

  void removeMealPlan(int index) {
    if (index >= 0 && index < _mealPlans.length) {
      _mealPlans.removeAt(index);
      notifyListeners();
    }
  }
}
