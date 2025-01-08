import 'package:get/get.dart';
import 'package:petagram/common/navigation/navigation.dart';
import 'package:petagram/common/utils/utils.dart';
import 'package:petagram/data/local/preference.dart';
import 'package:petagram/data/network/firebase/auth_repository.dart';
import 'package:petagram/presentation/screens/auth/login/login_screen.dart';

class ProfileController extends GetxController {
  final authRepository = FirebaseAuthRepository();
  final user = Preference.getUser(); // Get the user from preferences

  // Method to handle user logout
  void logout() async {
    Utils.showLoading('Signing out'); // Show a loading indicator

    // Sign the user out
    await authRepository.signOut();

    // Clear user preferences
    await Preference.clearPreferences();

    // Delay for 1 second (optional) to show the loading indicator
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to the LoginScreen after logout
    Navigation.navigateOffAllRightToLeft(const LoginScreen());
  }
}
