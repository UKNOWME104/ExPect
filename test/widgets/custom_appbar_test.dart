import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/constants/color_constants.dart';
import 'package:petagram/presentation/widgets/appbar/custom_appbar.dart';

void main() {
  group('CustomAppBar Widget Tests', () {
    testWidgets('renders CustomAppBar with only title', (WidgetTester tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text('Test Subtitle'), findsNothing); // Ensure no subtitle appears
    });

    testWidgets('renders CustomAppBar with title and subTitle', (WidgetTester tester) async {
      // Arrange
      const title = 'Test Title';
      const subTitle = 'Test Subtitle';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              subTitle: subTitle,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(subTitle), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2)); // Two Text widgets: title and subTitle
    });

    testWidgets('renders CustomAppBar with centered title', (WidgetTester tester) async {
      // Arrange
      const title = 'Centered Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              centerTitle: true,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, isTrue);
    });

    testWidgets('renders CustomAppBar with non-centered title', (WidgetTester tester) async {
      // Arrange
      const title = 'Non-Centered Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              centerTitle: false,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, isFalse);
    });

    testWidgets('checks styling of CustomAppBar title and subTitle', (WidgetTester tester) async {
      // Arrange
      const title = 'Styled Title';
      const subTitle = 'Styled Subtitle';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              subTitle: subTitle,
            ),
          ),
        ),
      );

      // Assert
      final titleText = tester.widget<Text>(find.text(title));
      final subTitleText = tester.widget<Text>(find.text(subTitle));

      expect(titleText.style, isNotNull);
      expect(titleText.style?.fontSize, 16.0); // Assuming `AppTextStyles.medium` has fontSize 16
      expect(subTitleText.style, isNotNull);
      expect(subTitleText.style?.fontSize, 12.0); // Assuming subTitle has fontSize 12
      expect(subTitleText.style?.color, ColorConstants.primaryColor);
    });
  });
}
