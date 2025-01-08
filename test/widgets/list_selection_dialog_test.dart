import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petagram/presentation/widgets/dialogs/list_selection_dialog.dart';

void main() {
  group('ListSelectionDialog Widget Tests', () {
    testWidgets('renders ListSelectionDialog with pet categories', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  await ListSelectionDialog.showStringListDialog();
                },
                child: const Text('Open Dialog'),
              );
            },
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Select an Item'), findsOneWidget);
      expect(find.text('Dogs'), findsOneWidget);
      expect(find.text('Cats'), findsOneWidget);
    });

    testWidgets('returns selected item from ListSelectionDialog', (WidgetTester tester) async {
      // Arrange
      String? selectedItem;

      await tester.pumpWidget(
        GetMaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  selectedItem = await ListSelectionDialog.showStringListDialog();
                },
                child: const Text('Open Dialog'),
              );
            },
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dogs'));
      await tester.pumpAndSettle();

      // Assert
      expect(selectedItem, 'Dogs');
    });

    testWidgets('closes ListSelectionDialog on item tap', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  await ListSelectionDialog.showStringListDialog();
                },
                child: const Text('Open Dialog'),
              );
            },
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cats'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Select an Item'), findsNothing); // Dialog should be closed
    });
  });
}
