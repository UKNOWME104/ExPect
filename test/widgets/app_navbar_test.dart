import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:petagram/constants/string_constants.dart';
import 'package:petagram/constants/color_constants.dart';
import 'package:petagram/presentation/widgets/navbar/app_navbar.dart';
import 'package:petagram/presentation/widgets/navbar/navbar_controller.dart';

void main() {
  group('AppNavBar Widget Tests', () {
    late NavBarController navBarController;

    setUp(() {
      navBarController = Get.put(NavBarController());
    });

    tearDown(() {
      Get.delete<NavBarController>();
    });

    testWidgets('renders AppNavBar with navigation items', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: const AppNavBar(),
        ),
      );

      // Assert
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text(StringConstants.home), findsOneWidget);
      expect(find.text(StringConstants.nearbyPets), findsOneWidget);
      expect(find.text(StringConstants.profile), findsOneWidget);
    });

    testWidgets('updates selected page on tap', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: const AppNavBar(),
        ),
      );

      // Act
      await tester.tap(find.text(StringConstants.nearbyPets));
      await tester.pumpAndSettle();

      // Assert
      expect(navBarController.currentIndex, 1);

      // Act
      await tester.tap(find.text(StringConstants.profile));
      await tester.pumpAndSettle();

      // Assert
      expect(navBarController.currentIndex, 2);
    });

    testWidgets('displays correct icon for selected index', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: const AppNavBar(),
        ),
      );

      // Act
      navBarController.updatePage(1);
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.near_me), findsOneWidget);
      expect(find.byIcon(Icons.near_me_outlined), findsNothing);

      // Act
      navBarController.updatePage(0);
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsNothing);
    });

    testWidgets('calls onBackPressed when back button is pressed', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        GetMaterialApp(
          home: const AppNavBar(),
        ),
      );

      // Act
      final result = await navBarController.onBackPressed();

      // Assert
      expect(result, isTrue); // Assuming the controller allows exiting.
    });
  });
}
