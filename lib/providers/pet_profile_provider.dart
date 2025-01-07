import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetProfileProvider with ChangeNotifier {
  Pet? _pet;

  Pet? get pet => _pet;

  void setPetProfile(Pet pet) {
    _pet = pet;
    notifyListeners();
  }

  void updatePetProfile(String name, String breed, int age, String medicalHistory) {
    if (_pet != null) {
      _pet = _pet!.copyWith(
        name: name,
        breed: breed,
        age: age,
        medicalHistory: medicalHistory,
      );
      notifyListeners();
    }
  }

  void clearPetProfile() {
    _pet = null;
    notifyListeners();
  }
}
