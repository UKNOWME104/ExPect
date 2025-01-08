import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petagram/constants/firebase_constants.dart';
import 'package:petagram/data/local/preference.dart';

class FavouritesController extends GetxController {
  final myFavouritesCollection = FirebaseFirestore.instance
      .collection(FirebaseConstants.favouritesCollection)
      .where(
        'userId',
        isEqualTo: Preference.getUser()?.id,
      );
}
