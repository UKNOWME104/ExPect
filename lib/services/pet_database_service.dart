import 'dart:convert';
import 'package:flutter/services.dart';

class PetDatabaseService {
  // Load the pets.json file
  Future<List<Map<String, dynamic>>> loadPetData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/pets.json');
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.cast<Map<String, dynamic>>();
    } catch (e) {
      print("Error loading pet database: $e");
      rethrow;
    }
  }
}
