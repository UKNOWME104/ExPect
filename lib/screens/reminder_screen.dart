import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reminder_provider.dart';
import '../models/reminder.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Reminders"),
        ),
        body: Center(
          child: Text("Please log in to view your reminders."),
        ),
      );
    }

    // Fetch reminders
    reminderProvider.fetchReminders(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
        backgroundColor: Colors.teal[400],
      ),
      body: ListView.builder(
        itemCount: reminderProvider.reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminderProvider.reminders[index];
          return ListTile(
            title: Text(reminder.title),
            subtitle: Text("${reminder.description}\n${reminder.date.toString()}"),
            isThreeLine: true,
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                reminderProvider.deleteReminder(userId, reminder.id);
              },
            ),
          );
        },
      ),
    );
  }
}
