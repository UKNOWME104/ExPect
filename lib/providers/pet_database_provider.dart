import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PetDatabaseProvider with ChangeNotifier {
  List<Map<String, dynamic>> _petBreeds = [];

  List<Map<String, dynamic>> get petBreeds => List.unmodifiable(_petBreeds);

  Future<void> loadPetBreeds() async {
    try {
      final jsonString = await rootBundle.loadString('assets/pets.json');
      _petBreeds = List<Map<String, dynamic>>.from(json.decode(jsonString));
      notifyListeners();
    } catch (e) {
      print('Error loading pet breeds: $e');
    }
  }
}
