import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../lib/screens/auth/AuthService.dart'; // Replace with your actual file path

// Mock classes
class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockGoogleSignIn extends Mock implements GoogleSignIn {}
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}
class MockGoogleSignInAuthentication extends Mock implements GoogleSignInAuthentication {}
class MockUserCredential extends Mock implements UserCredential {}
class MockAuthCredential extends Mock implements AuthCredential {}

void main() {
  late AuthService authService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuth;
  late MockAuthCredential mockAuthCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuth = MockGoogleSignInAuthentication();
    mockAuthCredential = MockAuthCredential();
    authService = AuthService(); // Use mockFirebaseAuth and mockGoogleSignIn in real scenario
  });

  group('AuthService Google Sign-In Tests', () {
    test('successful Google sign-in', () async {
      // Mocking GoogleSignIn to return a mock account
      when(mockGoogleSignIn.signIn()).thenAnswer((_) async => mockGoogleSignInAccount);

      // Mocking the authentication details
      when(mockGoogleSignInAccount.authentication).thenAnswer((_) async => mockGoogleSignInAuth);
      when(mockGoogleSignInAuth.accessToken).thenReturn('mockAccessToken');
      when(mockGoogleSignInAuth.idToken).thenReturn('mockIdToken');

      // Mocking signInWithCredential to return a mock UserCredential

      // Calling the method
      final result = await authService.signInWithGoogle();

      // Verifying the result
      expect(result, isA<UserCredential>());
    });

    test('Google sign-in failure', () async {
      // Simulating Google Sign-In failure
      when(mockGoogleSignIn.signIn()).thenThrow(Exception('Google Sign-In failed'));

      try {
        await authService.signInWithGoogle();
      } catch (e) {
        // Verifying that the exception is caught
        expect(e.toString(), contains('Google Sign-In failed'));
      }
    });
  });
}
