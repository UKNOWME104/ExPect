import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/presentation/widgets/buttons/primary_button.dart';

void main() {
  group('PrimaryButton Widget Tests', () {
    testWidgets('renders PrimaryButton with default properties', (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Test Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: buttonText,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('renders PrimaryButton in loading state', (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Test Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: buttonText,
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(buttonText), findsNothing); // Text should not appear when loading
    });

    testWidgets('renders PrimaryButton with prefix icon', (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Test Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: buttonText,
              prefixIcon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(Icon), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);
    });

    testWidgets('calls onPressed when button is tapped', (WidgetTester tester) async {
      // Arrange
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: 'Test Button',
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(buttonPressed, isTrue);
    });

    testWidgets('does not call onPressed when button is loading', (WidgetTester tester) async {
      // Arrange
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: 'Test Button',
              isLoading: true,
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(buttonPressed, isFalse);
    });
  });
}
