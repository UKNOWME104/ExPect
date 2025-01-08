import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/presentation/widgets/form_field/primary_form_field.dart';

void main() {
  group('PrimaryFormField Widget Tests', () {
    testWidgets('renders PrimaryFormField with default properties', (WidgetTester tester) async {
      // Arrange
      final textController = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryFormField(
              hint: 'Enter text',
              controller: textController,
              validatorFunction: (_) => null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('displays label text when provided', (WidgetTester tester) async {
      // Arrange
      final textController = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryFormField(
              hint: 'Enter text',
              label: 'Label Text',
              controller: textController,
              validatorFunction: (_) => null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Label Text'), findsOneWidget);
    });

    testWidgets('toggles password visibility', (WidgetTester tester) async {
      // Arrange
      final textController = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryFormField(
              hint: 'Enter password',
              isPassword: true,
              controller: textController,
              validatorFunction: (_) => null,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('validates input with validatorFunction', (WidgetTester tester) async {
      // Arrange
      final textController = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PrimaryFormField(
                hint: 'Enter text',
                controller: textController,
                validatorFunction: (value) {
                  return value == null || value.isEmpty ? 'Field is required' : null;
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
      expect(find.text('Field is required'), findsOneWidget);
    });

    testWidgets('calls onTap when the form field is tapped', (WidgetTester tester) async {
      // Arrange
      bool tapped = false;
      final textController = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryFormField(
              hint: 'Tap me',
              controller: textController,
              onTap: () {
                tapped = true;
              },
              validatorFunction: (_) => null,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(TextFormField));
      await tester.pumpAndSettle();

      // Assert
      expect(tapped, isTrue);
    });
  });
}
