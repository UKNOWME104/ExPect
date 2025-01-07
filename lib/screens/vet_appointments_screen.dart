import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appointment_provider.dart';
import '../models/appointment.dart';

class VetAppointmentsScreen extends StatelessWidget {
  final TextEditingController _reasonController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Vet Appointments"),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Schedule Appointment",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(labelText: "Reason"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  _selectedDate = pickedDate;
                }
              },
              child: Text(_selectedDate == null
                  ? "Select Date"
                  : "Selected Date: ${_selectedDate.toString().split(' ')[0]}"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null) {
                  provider.addAppointment(
                    Appointment(
                      id: DateTime.now().millisecondsSinceEpoch.toString(), // Create a unique ID
                      reason: _reasonController.text,
                      dateTime: _selectedDate!, // Use the selected date
                    ),
                  );
                  _reasonController.clear();
                  _selectedDate = null;
                }
              },
              child: Text("Add Appointment"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
            ),
            SizedBox(height: 20),
            Text(
              "Upcoming Appointments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.appointments.length,
                itemBuilder: (context, index) {
                  final appointment = provider.appointments[index];
                  return ListTile(
                    title: Text("Reason: ${appointment.reason}"),
                    subtitle: Text("Date: ${appointment.dateTime.toString().split(' ')[0]}"), // Fix this line to use dateTime
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
