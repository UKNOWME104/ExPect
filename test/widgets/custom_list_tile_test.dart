import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/presentation/widgets/list_tile/custom_list_tile.dart';

void main() {
  group('CustomListTile Widget Tests', () {
    testWidgets('renders CustomListTile with icon and text', (WidgetTester tester) async {
      // Arrange
      const leadingIcon = Icons.home;
      const text = 'Home';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomListTile(
              leadingIcon: leadingIcon,
              text: text,
              onTap: null,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(leadingIcon), findsOneWidget);
      expect(find.text(text), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      // Arrange
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomListTile(
              leadingIcon: Icons.home,
              text: 'Home',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      // Assert
      expect(tapped, isTrue);
    });

    testWidgets('renders text with regular style', (WidgetTester tester) async {
      // Arrange
      const text = 'Settings';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomListTile(
              leadingIcon: Icons.settings,
              text: text,
              onTap: null,
            ),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<Text>(find.text(text));
      expect(textWidget.style, isNotNull); // Ensure text style is applied
    });
  });
}
