import 'package:flutter/material.dart';
import '../models/medication.dart';

class MedicationProvider with ChangeNotifier {
  List<Medication> _medications = [];

  List<Medication> get medications => List.unmodifiable(_medications);

  void addMedication(Medication medication) {
    _medications.add(medication);
    notifyListeners();
  }

  void updateMedication(int index, Medication updatedMedication) {
    if (index >= 0 && index < _medications.length) {
      _medications[index] = updatedMedication;
      notifyListeners();
    }
  }

  void removeMedication(int index) {
    if (index >= 0 && index < _medications.length) {
      _medications.removeAt(index);
      notifyListeners();
    }
  }
}
