// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:petagram/presentation/screens/add_pet_screen.dart';
// import 'package:petagram/presentation/controllers/add_pet_controller.dart';
// import 'package:petagram/models/pet/pet.dart';
//
// // Create a mock class for AddPetController
// class MockAddPetController extends Mock implements AddPetController {}
//
// void main() {
//   late MockAddPetController mockAddPetController;
//
//   setUp(() {
//     mockAddPetController = MockAddPetController();
//   });
//
//   testWidgets('AddPetScreen displays correct form and handles submit', (WidgetTester tester) async {
//     // Arrange: Mock the controller behavior
//     when(() => mockAddPetController.setPetDetails(any())).thenReturn(null);
//     when(() => mockAddPetController.savePet(any())).thenAnswer((_) async => null);
//
//     // Act: Pump AddPetScreen with the mock controller
//     await tester.pumpWidget(
//       MaterialApp(
//         home: GetBuilder<AddPetController>(
//           init: mockAddPetController,
//           builder: (controller) => AddPetScreen(),
//         ),
//       ),
//     );
//
//     // Assert: Verify that form fields are displayed
//     expect(find.text('Please fill in the details'), findsOneWidget);
//     expect(find.text('Name'), findsOneWidget); // This is the hint for the name field
//     expect(find.byType(TextFormField), findsNWidgets(7)); // 7 text fields (name, description, color, etc.)
//
//     // Act: Fill in the form and submit
//     await tester.enterText(find.byType(TextFormField).at(0), 'Buddy');
//     await tester.enterText(find.byType(TextFormField).at(1), 'A cute dog');
//     await tester.enterText(find.byType(TextFormField).at(2), 'Brown');
//     await tester.enterText(find.byType(TextFormField).at(3), '2');
//     await tester.enterText(find.byType(TextFormField).at(4), 'John Doe');
//     await tester.enterText(find.byType(TextFormField).at(5), '1234567890');
//
//     // Trigger form submission
//     await tester.tap(find.byType(PrimaryButton)); // This assumes PrimaryButton is used for submitting
//     await tester.pump();
//
//     // Assert: Ensure that savePet is called when form is submitted
//     verify(() => mockAddPetController.savePet(any())).called(1);
//   });
//
//   testWidgets('AddPetScreen handles image picking', (WidgetTester tester) async {
//     // Arrange: Mock the controller behavior for image picking
//     when(() => mockAddPetController.pickImageFrom(any())).thenReturn(null);
//
//     // Act: Pump AddPetScreen
//     await tester.pumpWidget(
//       MaterialApp(
//         home: GetBuilder<AddPetController>(
//           init: mockAddPetController,
//           builder: (controller) => AddPetScreen(),
//         ),
//       ),
//     );
//
//     // Tap the image picker
//     await tester.tap(find.byType(InkWell));  // The widget for image selection
//     await tester.pumpAndSettle();  // Wait for bottom sheet animation
//
//     // Act: Simulate selecting an image from the gallery
//     await tester.tap(find.text('Gallery'));  // or Camera if testing camera
//     await tester.pump();
//
//     // Assert: Ensure image picker method is called
//     verify(() => mockAddPetController.pickImageFrom(ImageSource.gallery)).called(1);
//   });
//
//   testWidgets('AddPetScreen can delete a pet', (WidgetTester tester) async {
//     // Arrange: Mock the controller behavior for pet deletion
//     when(() => mockAddPetController.deletePet(any())).thenAnswer((_) async => null);
//
//     // Act: Pump AddPetScreen with a pet
//     Pet testPet = Pet(
//       id: '1',
//       name: 'Buddy',
//       category: 'Dog',
//       description: 'A cute dog',
//       color: 'Brown',
//       age: '2',
//       ownerName: 'John Doe',
//       ownerContactNumber: '1234567890',
//       createdBy: 'User',
//       image: 'https://example.com/image.jpg',
//     );
//
//     await tester.pumpWidget(
//       MaterialApp(
//         home: GetBuilder<AddPetController>(
//           init: mockAddPetController,
//           builder: (controller) => AddPetScreen(pet: testPet),
//         ),
//       ),
//     );
//
//     // Act: Tap the delete button
//     await tester.tap(find.text('Delete Pet'));
//     await tester.pump();
//
//     // Assert: Ensure deletePet method is called
//     verify(() => mockAddPetController.deletePet(testPet.id)).called(1);
//   });
// }
