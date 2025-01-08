import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petagram/common/utils/utils.dart';
import 'package:petagram/presentation/screens/home/home_screen.dart';
import 'package:petagram/presentation/screens/nearby/nearby_screen.dart';
import 'package:petagram/presentation/screens/profile/profile_screen.dart';

class NavBarController extends GetxController {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const NearbyScreen(),
    const ProfileScreen(),
  ];

  void updatePage(int index) {
    if (index >= 0 && index <= 2) {
      currentIndex = index;
    }
    update();
  }

  bool onBackPressed() {
    if (currentIndex > 0) {
      currentIndex = 0;
      update();
      return false;
    } else {
      return Utils.onBackPressed();
    }
  }
}
