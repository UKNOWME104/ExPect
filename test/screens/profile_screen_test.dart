// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
// import 'package:petagram/presentation/screens/profile/profile_screen.dart';
// import 'package:petagram/presentation/screens/pets/add_pet/add_pet_screen.dart';
// import 'package:petagram/presentation/screens/pets/my_pets/my_pets_screen.dart';
// import 'package:petagram/presentation/screens/pets/favourites_pets/favourites_screen.dart';
// import 'package:petagram/presentation/screens/profile/profile_controller.dart';
// import 'package:petagram/constants/string_constants.dart';
// import 'package:mockito/annotations.dart';
//
//
// @GenerateMocks([ProfileController])
// void main() {
//   group('ProfileScreen Tests', () {
//     late ProfileController mockController;
//     late User mockUser;
//
//     setUp(() {
//       mockController = MockProfileController();
//       mockUser = User(fullName: 'John Doe', email: 'john.doe@example.com');
//
//       when(mockController.user).thenReturn(mockUser);
//       when(mockController.logout()).thenAnswer((_) async => null);
//     });
//
//     testWidgets('ProfileScreen renders correctly with user info', (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         GetMaterialApp(
//           home: ProfileScreen(),
//         ),
//       );
//
//       // Act
//       await tester.pumpAndSettle();
//
//       // Assert: Check if user info is displayed
//       expect(find.text('John Doe'), findsOneWidget);
//       expect(find.text('john.doe@example.com'), findsOneWidget);
//     });
//
//     testWidgets('Navigates to MyPetsScreen when "My Pets" is tapped', (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         GetMaterialApp(
//           home: ProfileScreen(),
//         ),
//       );
//
//       // Act: Tap on "My Pets"
//       await tester.tap(find.text(StringConstants.myPets));
//       await tester.pumpAndSettle();
//
//       // Assert: Verify that the navigation works correctly
//       expect(find.byType(MyPetsScreen), findsOneWidget);
//     });
//
//     testWidgets('Navigates to AddPetScreen when "Add Pet" is tapped', (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         GetMaterialApp(
//           home: ProfileScreen(),
//         ),
//       );
//
//       // Act: Tap on "Add Pet"
//       await tester.tap(find.text(StringConstants.addPet));
//       await tester.pumpAndSettle();
//
//       // Assert: Verify that the navigation works correctly
//       expect(find.byType(AddPetScreen), findsOneWidget);
//     });
//
//     testWidgets('Navigates to MyFavouritesScreen when "My Favourites" is tapped', (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         GetMaterialApp(
//           home: ProfileScreen(),
//         ),
//       );
//
//       // Act: Tap on "My Favourites"
//       await tester.tap(find.text(StringConstants.myFavourites));
//       await tester.pumpAndSettle();
//
//       // Assert: Verify that the navigation works correctly
//       expect(find.byType(MyFavouritesScreen), findsOneWidget);
//     });
//
//     testWidgets('Logout functionality works correctly', (WidgetTester tester) async {
//       // Arrange
//       await tester.pumpWidget(
//         GetMaterialApp(
//           home: ProfileScreen(),
//         ),
//       );
//
//       // Act: Tap on the "Logout" button
//       await tester.tap(find.text(StringConstants.logout));
//       await tester.pumpAndSettle();
//
//       // Assert: Verify that the logout method is called
//       verify(mockController.logout()).called(1);
//     });
//   });
// }
