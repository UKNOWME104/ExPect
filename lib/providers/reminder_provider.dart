import 'package:flutter/material.dart';
import 'package:petagram/models/reminder.dart';
import 'package:petagram/services/firebase_service.dart';

class ReminderProvider with ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  // Fetch reminders from Firebase
  Future<void> fetchReminders(String userId) async {
    _reminders = await FirebaseService().fetchReminders(userId);
    notifyListeners();
  }

  // Add a reminder
  Future<void> addReminder(String userId, Reminder reminder) async {
    await FirebaseService().saveReminder(userId, reminder);
    _reminders.add(reminder);
    notifyListeners();
  }

  // Update a reminder
  Future<void> updateReminder(String userId, Reminder reminder) async {
    await FirebaseService().updateReminder(userId, reminder);
    final index = _reminders.indexWhere((r) => r.id == reminder.id);
    if (index >= 0) {
      _reminders[index] = reminder;
      notifyListeners();
    }
  }

  // Delete a reminder
  Future<void> deleteReminder(String userId, String reminderId) async {
    await FirebaseService().deleteReminder(userId, reminderId);
    _reminders.removeWhere((r) => r.id == reminderId);
    notifyListeners();
  }
}
