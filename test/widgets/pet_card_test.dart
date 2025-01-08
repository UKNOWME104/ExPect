import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petagram/constants/string_constants.dart';
import 'package:petagram/presentation/widgets/pet/pet_card.dart';

void main() {
  group('PetCard Widget Tests', () {
    const petName = 'Buddy';
    const petDescription = 'A friendly golden retriever';
    const petImageUrl = 'https://example.com/pet.jpg';
    const petAge = '2 years';
    const petColor = 'Golden';

    testWidgets('renders PetCard with name, description, age, and color', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              name: petName,
              description: petDescription,
              imageUrl: petImageUrl,
              age: petAge,
              color: petColor,
              onPressed: null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(petName), findsOneWidget);
      expect(find.text(petDescription), findsOneWidget);
      expect(find.textContaining('${StringConstants.age}: $petAge'), findsOneWidget);
      expect(find.textContaining('${StringConstants.color}: $petColor'), findsOneWidget);
    });

    testWidgets('displays image from the provided URL', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              name: petName,
              description: petDescription,
              imageUrl: petImageUrl,
              age: petAge,
              color: petColor,
              onPressed: null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('shows error icon if image fails to load', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              name: petName,
              description: petDescription,
              imageUrl: 'invalid-url',
              age: petAge,
              color: petColor,
              onPressed: null,
            ),
          ),
        ),
      );

      // Allow CachedNetworkImage to complete its loading
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('calls onPressed callback when tapped', (WidgetTester tester) async {
      // Arrange
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              name: petName,
              description: petDescription,
              imageUrl: petImageUrl,
              age: petAge,
              color: petColor,
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(PetCard));
      await tester.pumpAndSettle();

      // Assert
      expect(tapped, isTrue);
    });

    testWidgets('applies animation when widget is rendered', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              name: petName,
              description: petDescription,
              imageUrl: petImageUrl,
              age: petAge,
              color: petColor,
              onPressed: null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(AnimatedBuilder), findsOneWidget);
    });
  });
}
