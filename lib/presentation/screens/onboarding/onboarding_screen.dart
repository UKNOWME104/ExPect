import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:petagram/constants/app_constants.dart';
import 'package:petagram/constants/color_constants.dart';
import 'package:petagram/data/local/preference.dart';
import 'package:petagram/presentation/screens/auth/login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final Color kDarkBlueColor = ColorConstants.primaryColor;

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: _onSkip,
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: Colors.white,
      activeDotColor: Colors.blue,
      deactiveDotColor: Colors.grey,
      iconColor: Colors.black,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: AppConstants.onBoardingPages,
    );
  }

  void _onSkip() async {
    Preference.setFirstLaunch(false);
    Get.offAll(
      () => const LoginScreen(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 350),
    );
  }
}
