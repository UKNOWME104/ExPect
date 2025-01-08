import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petagram/constants/string_constants.dart';
import 'package:petagram/presentation/screens/auth/login/login_screen.dart';
import 'package:petagram/presentation/screens/auth/signup/signup_screen.dart';

void main() {
  group('SignupScreen', () {
    setUp(() {
      Get.testMode = true;
    });

    testWidgets('renders SignupScreen properly', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: const SignupScreen()));

      // Check if the "Create New Account" text is shown
      expect(find.text(StringConstants.createNewAcc), findsOneWidget);

      // Check if the signup image is present
      expect(find.byType(Image), findsOneWidget);

      // Check if all form fields are present
      expect(find.byType(TextFormField), findsNWidgets(5));

      // Check if the Create Account button is present
      expect(find.text(StringConstants.createAccount), findsOneWidget);

      // Check if the "Already have an account" text is shown
      expect(find.text(StringConstants.haveAnAccount), findsOneWidget);
    });

    testWidgets('navigates to LoginScreen when login link is tapped',
            (tester) async {
          await tester.pumpWidget(GetMaterialApp(home: const SignupScreen()));

          // Tap on the "Login" link
          final loginLink =
          find.text(StringConstants.login).hitTestable(); // Ensure it's tappable
          await tester.tap(loginLink);

          // Rebuild the widget to reflect navigation
          await tester.pumpAndSettle();

          // Verify navigation to LoginScreen
          expect(find.byType(LoginScreen), findsOneWidget);
        });

    testWidgets('shows validation errors when form is submitted with empty fields',
            (tester) async {
          await tester.pumpWidget(GetMaterialApp(home: const SignupScreen()));

          // Tap the Create Account button without entering any details
          final createAccountButton = find.text(StringConstants.createAccount);
          await tester.tap(createAccountButton);

          // Rebuild the widget to reflect validation errors
          await tester.pump();

          // Check if validation error messages are displayed
          expect(find.text('Please enter your full name'), findsOneWidget);
          expect(find.text('Please enter a valid email address'), findsOneWidget);
          expect(find.text('Please enter a valid phone number'), findsOneWidget);
          expect(find.text('Please enter a strong password'), findsOneWidget);
        });

    testWidgets('validates and submits the form', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: const SignupScreen()));

      // Enter valid details
      await tester.enterText(
          find.widgetWithText(TextFormField, StringConstants.fullName),
          'John Doe');
      await tester.enterText(
          find.widgetWithText(TextFormField, StringConstants.emailAddress),
          'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, StringConstants.phoneNumber),
          '1234567890');
      await tester.enterText(
          find.widgetWithText(TextFormField, StringConstants.password),
          'StrongPassword123');
      await tester.enterText(
          find.widgetWithText(TextFormField, StringConstants.confirmPassword),
          'StrongPassword123');

      // Tap the Create Account button
      final createAccountButton = find.text(StringConstants.createAccount);
      await tester.tap(createAccountButton);

      // Rebuild the widget to reflect the result
      await tester.pump();

      // Add further assertions here, e.g., checking the controller's signUp method is called
    });
  });
}
