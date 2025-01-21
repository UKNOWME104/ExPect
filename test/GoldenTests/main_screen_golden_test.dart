import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:petagram/screens/home/views/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

// Mocking an Expense model
class MockExpense extends Mock implements Expense {}

void main() {
  testGoldens('MainScreen golden test', (tester) async {
    // Create mock expenses data
    final List<Expense> mockExpenses = [
      MockExpense()
        ..amount = 100
        ..category = Category(categoryId: '1', name: 'Food', color: 0xFF0000, totalExpenses: 122, icon: 'assets/tech.png' )
        ..date = DateTime.now(),
      MockExpense()
        ..amount = 50
        ..category = Category(categoryId: '2', name: 'Transport', color: 0x00FF00, totalExpenses: 233, icon: 'assets/tech.png')
        ..date = DateTime.now().subtract(Duration(days: 1)),
    ];

    // Build the widget with the mock expenses
    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: MainScreen(mockExpenses),
        ),
      ),
    );

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Capture the golden image
    await screenMatchesGolden(tester, 'main_screen');
  });
}
