import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petagram/models/pet.dart';
import 'package:petagram/models/reminder.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save pet profile
  Future<void> savePetProfile(String userId, Pet pet) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .add(pet.toMap());
    } catch (e) {
      print("Error saving pet profile: $e");
      rethrow;
    }
  }

  // Fetch all pet profiles
  Future<List<Pet>> fetchPetProfiles(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .get();

      return querySnapshot.docs
          .map((doc) => Pet.fromMap(doc.data(), doc.id)) // Corrected line
          .toList();
    } catch (e) {
      print("Error fetching pet profiles: $e");
      rethrow;
    }
  }

  // Update pet profile
  Future<void> updatePetProfile(String userId, Pet pet) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .doc(pet.id)
          .update(pet.toMap());
    } catch (e) {
      print("Error updating pet profile: $e");
      rethrow;
    }
  }

  // Save reminder
  Future<void> saveReminder(String userId, Reminder reminder) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('reminders')
          .add(reminder.toMap());
    } catch (e) {
      print("Error saving reminder: $e");
      rethrow;
    }
  }

  // Fetch reminders
  Future<List<Reminder>> fetchReminders(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('reminders')
          .get();

      return querySnapshot.docs
          .map((doc) => Reminder.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print("Error fetching reminders: $e");
      rethrow;
    }
  }

  // Update reminder
  Future<void> updateReminder(String userId, Reminder reminder) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('reminders')
          .doc(reminder.id)
          .update(reminder.toMap());
    } catch (e) {
      print("Error updating reminder: $e");
      rethrow;
    }
  }

  // Delete reminder
  Future<void> deleteReminder(String userId, String reminderId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('reminders')
          .doc(reminderId)
          .delete();
    } catch (e) {
      print("Error deleting reminder: $e");
      rethrow;
    }
  }
}
