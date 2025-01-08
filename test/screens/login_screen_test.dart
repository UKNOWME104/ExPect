import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petagram/constants/string_constants.dart';
import 'package:petagram/presentation/screens/auth/login/login_screen.dart';
import 'package:petagram/presentation/screens/auth/signup/signup_screen.dart';

void main() {
  group('LoginScreen', () {
    setUp(() {
      Get.testMode = true;
    });

    testWidgets('renders LoginScreen properly', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: const LoginScreen()));

      // Check if the welcome text is shown
      expect(find.text(StringConstants.welcomeBack), findsOneWidget);

      // Check if the login image is present
      expect(find.byType(Image), findsOneWidget);

      // Check if email and password form fields are present
      expect(find.byType(TextFormField), findsNWidgets(2));

      // Check if the Login button is present
      expect(find.text(StringConstants.login), findsOneWidget);

      // Check if the "Don't have an account" text is shown
      expect(find.text(StringConstants.dontHaveAnAcc), findsOneWidget);
    });

    testWidgets('navigates to SignupScreen when register link is tapped',
            (tester) async {
          await tester.pumpWidget(GetMaterialApp(home: const LoginScreen()));

          // Tap on the "Register" link
          final registerLink =
          find.text(StringConstants.register).hitTestable(); // Ensure it's tappable
          await tester.tap(registerLink);

          // Rebuild the widget to reflect navigation
          await tester.pumpAndSettle();

          // Verify navigation to SignupScreen
          expect(find.byType(SignupScreen), findsOneWidget);
        });

    testWidgets('shows validation error when form is submitted with empty fields',
            (tester) async {
          await tester.pumpWidget(GetMaterialApp(home: const LoginScreen()));

          // Tap the Login button without entering any details
          final loginButton = find.text(StringConstants.login);
          await tester.tap(loginButton);

          // Rebuild the widget to reflect validation errors
          await tester.pump();

          // Check if validation error messages are displayed
          expect(find.text('Please enter a valid email address'), findsOneWidget);
          expect(find.text('Please enter a valid password'), findsOneWidget);
        });

    testWidgets('validates email and password and submits the form',
            (tester) async {
          await tester.pumpWidget(GetMaterialApp(home: const LoginScreen()));

          // Enter a valid email and password
          await tester.enterText(
              find.widgetWithText(TextFormField, StringConstants.emailAddress),
              'test@example.com');
          await tester.enterText(
              find.widgetWithText(TextFormField, StringConstants.password),
              'password123');

          // Tap the Login button
          final loginButton = find.text(StringConstants.login);
          await tester.tap(loginButton);

          // Rebuild the widget to reflect the result
          await tester.pump();

          // Add further assertions here, e.g., checking the controller's login method is called
        });
  });
}
