import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/medication_provider.dart';
import '../models/medication.dart';

class MedicationScreen extends StatelessWidget {
  final TextEditingController _medicationNameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MedicationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Medication Reminders"),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Medication Reminder",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            TextField(
              controller: _medicationNameController,
              decoration: InputDecoration(labelText: "Medication Name"),
            ),
            TextField(
              controller: _doseController,
              decoration: InputDecoration(labelText: "Dose"),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: "Time (e.g., 9:00 AM)"),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final medication = Medication(
                  id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate a unique ID
                  name: _medicationNameController.text,
                  dose: _doseController.text,
                  time: _timeController.text,
                );
                provider.addMedication(medication);
                _medicationNameController.clear();
                _doseController.clear();
                _timeController.clear();
              },
              child: Text("Add Reminder"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
            ),
            SizedBox(height: 20),
            Text(
              "Upcoming Medications",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.medications.length,
                itemBuilder: (context, index) {
                  final medication = provider.medications[index];
                  return ListTile(
                    title: Text(medication.name),
                    subtitle: Text("Dose: ${medication.dose} | Time: ${medication.time}"),
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
