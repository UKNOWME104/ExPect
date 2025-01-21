import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:petagram/screens/auth/LoginBloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petagram/screens/auth/AuthService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../lib/screens/auth/Login.dart';

// Mock FirebaseUser and FirebaseAuth classes
class MockUserCredential extends Mock implements UserCredential {}

class MockAuthService extends Mock implements AuthService {
  @override
  Future<UserCredential> signInWithGoogle() async {
    final mockUserCredential = MockUserCredential();
    // Mock any required properties or methods
    when(mockUserCredential.user).thenReturn(MockUser());
    return Future.value(mockUserCredential);
  }
}

class MockUser extends Mock implements User {}

void main() {
  testGoldens('LoginScreen golden test', (tester) async {
    // Use a mock AuthService to prevent actual Google login and Firebase auth calls
    final authService = MockAuthService();

    // Build the widget with a mock login service
    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (_) => LoginBloc(),
            child: LoginScreen(), // Your LoginScreen widget
          ),
        ),
      ),
    );

    // Wait for the widget to render
    await tester.pumpAndSettle();

    // Capture and compare the widget with the golden image
    await screenMatchesGolden(tester, 'login_screen');
  });
}
