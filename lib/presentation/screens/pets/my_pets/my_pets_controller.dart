import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petagram/constants/firebase_constants.dart';
import 'package:petagram/data/local/preference.dart';

class MyPetsController extends GetxController {
  final myPetsCollection = FirebaseFirestore.instance
      .collection(FirebaseConstants.petsCollection)
      .where(
        'createdBy',
        isEqualTo: Preference.getUser()!.id,
      );
}
