import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:petagram/screens/auth/LoginBloc.dart';

import '../../lib/screens/auth/Login.dart';

void main() {
  testGoldens('LoginScreen golden test', (tester) async {
    // Build the widget
    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );

    // Wait for the widget to render
    await tester.pumpAndSettle();

    // Capture and compare the widget with the golden image
    await screenMatchesGolden(tester, 'login_screen');
  });
}
