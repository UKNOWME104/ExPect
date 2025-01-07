import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meal_plan_provider.dart';
import '../models/meal_plan.dart';

class MealPlanScreen extends StatelessWidget {
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealPlanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Plan"),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Meal Plan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            TextField(
              controller: _mealController,
              decoration: InputDecoration(labelText: "Meal"),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: "Time (e.g., 9:00 AM)"),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final mealPlan = MealPlan(
                  id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate a unique ID
                  meal: _mealController.text,
                  time: DateTime.parse('1970-01-01 ${_timeController.text}:00'), // Create DateTime object from time
                );
                provider.addMealPlan(mealPlan);
                _mealController.clear();
                _timeController.clear();
              },
              child: Text("Add Meal Plan"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
            ),
            SizedBox(height: 20),
            Text(
              "Upcoming Meals",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.mealPlans.length,
                itemBuilder: (context, index) {
                  final mealPlan = provider.mealPlans[index];
                  return ListTile(
                    title: Text(mealPlan.meal),
                    subtitle: Text("Time: ${mealPlan.time.toString().split(' ')[1].substring(0, 5)}"), // Format time (HH:mm)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
