import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/presentation/widgets/dropdown/custom_dropdown.dart';

void main() {
  group('CustomDropDown Widget Tests', () {
    final dropdownItems = [
      DropdownMenuItem<String>(
        value: 'Item 1',
        child: Text('Item 1'),
      ),
      DropdownMenuItem<String>(
        value: 'Item 2',
        child: Text('Item 2'),
      ),
      DropdownMenuItem<String>(
        value: 'Item 3',
        child: Text('Item 3'),
      ),
    ];

    testWidgets('renders CustomDropDown with items and label', (WidgetTester tester) async {
      // Arrange
      const dropdownLabel = 'Select an Item';
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDropDown<String>(
              labelText: dropdownLabel,
              items: dropdownItems,
              value: selectedValue,
              onChanged: (value) {
                selectedValue = value;
              },
              validator: (value) {
                return value == null ? 'Please select an item' : null;
              },
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(dropdownLabel), findsOneWidget);
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    });

    testWidgets('updates selected value on selection', (WidgetTester tester) async {
      // Arrange
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDropDown<String>(
              items: dropdownItems,
              value: selectedValue,
              onChanged: (value) {
                selectedValue = value;
              },
              validator: (_) => null,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Item 2').last);
      await tester.pumpAndSettle();

      // Assert
      expect(selectedValue, 'Item 2');
    });

    testWidgets('displays validation error if value is null', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: CustomDropDown<String>(
                items: dropdownItems,
                value: null,
                onChanged: (_) {},
                validator: (value) {
                  return value == null ? 'Please select an item' : null;
                },
              ),
            ),
          ),
        ),
      );

      // Act
      final formKey = GlobalKey<FormState>();
      formKey.currentState?.validate();
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Please select an item'), findsOneWidget);
    });
  });
}
