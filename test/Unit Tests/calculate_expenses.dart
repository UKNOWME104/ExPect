import 'package:flutter_test/flutter_test.dart';
import 'package:expense_repository/expense_repository.dart'; // Replace with actual import if needed
import 'package:flutter/material.dart';

import '../../lib/screens/home/views/main_screen.dart';


void main() {
  group('MainScreen - _calculateTotalExpenses', () {
    // Test Case 1: Check if total expenses are calculated correctly
    test('Calculate total expenses', () {
      // Create a list of expenses
      final expenses = [
        Expense(expenseId:'122',amount: 50, category: Category(categoryId: 'edf',name: 'Food', color: 0xFF000000, icon: 'food',totalExpenses: 109,), date: DateTime.now()),
        Expense(expenseId:'1w22',amount: 100, category: Category(categoryId: 'sf',name: 'Transport', color: 0xFF000000, icon: 'transport',totalExpenses: 1109,), date: DateTime.now()),
        Expense(expenseId:'122',amount: 150, category: Category(categoryId: 'efwfdf',name: 'Entertainment', color: 0xFF000000, icon: 'entertainment', totalExpenses: 109, ), date: DateTime.now()),
      ];

      // Create the MainScreen widget with the list of expenses
      final mainScreen = MainScreen(expenses);

      // Get the total expenses
      final totalExpenses = mainScreen.calculateTotalExpenses(expenses);

      // Check if the total is calculated correctly
      expect(totalExpenses, 300.0); // Expecting 50 + 100 + 150 = 300
    });

    // Test Case 2: Check if total expenses are 0 for an empty list
    test('Calculate total expenses for an empty list', () {
      // Create an empty list of expenses
      final expenses = <Expense>[];

      // Create the MainScreen widget with the empty list of expenses
      final mainScreen = MainScreen(expenses);

      // Get the total expenses
      final totalExpenses = mainScreen.calculateTotalExpenses(expenses);

      // Check if the total is 0 for an empty list
      expect(totalExpenses, 0.0); // Expecting 0 for an empty list
    });
  });
}
