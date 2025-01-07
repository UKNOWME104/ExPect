import 'package:flutter/material.dart';
import '../models/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  List<Appointment> _appointments = [];

  List<Appointment> get appointments => List.unmodifiable(_appointments);

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void updateAppointment(int index, Appointment updatedAppointment) {
    if (index >= 0 && index < _appointments.length) {
      _appointments[index] = updatedAppointment;
      notifyListeners();
    }
  }

  void removeAppointment(int index) {
    if (index >= 0 && index < _appointments.length) {
      _appointments.removeAt(index);
      notifyListeners();
    }
  }
}
