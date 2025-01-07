import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petagram/providers/reminder_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart'; // Import the App widget
import 'providers/pet_profile_provider.dart';
import 'providers/meal_plan_provider.dart';
import 'providers/medication_provider.dart';
import 'providers/appointment_provider.dart';
import 'providers/pet_database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PetProfileProvider()),
        ChangeNotifierProvider(create: (_) => MealPlanProvider()),
        ChangeNotifierProvider(create: (_) => MedicationProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => PetDatabaseProvider()),
        ChangeNotifierProvider(create: (_) => ReminderProvider()),

      ],
      child: const App(),
    );
  }
}
