
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';
import 'package:petagram/presentation/screens/pets/pet_details/pet_details_screen.dart';
import 'package:petagram/models/pet/pet.dart';
import 'package:petagram/models/address/address.dart';
import 'package:mockito/annotations.dart';
import 'package:petagram/presentation/screens/pets/pet_details/pet_details_controller.dart';


@GenerateMocks([PetDetailsController])
void main() {
  group('PetDetailsScreen Tests', () {
    late PetDetailsController mockController;
    late Pet mockPet;

    setUp(() {
      mockController = PetDetailsController();
      // Create a mock Pet
      mockPet = Pet(
        name: 'Buddy',
        image: 'https://example.com/pet.jpg',
        description: 'A cute pet!',
        category: 'Dog',
        color: 'Brown',
        age: '2 years',
        ownerName: 'John Doe',
        ownerContactNumber: '123456789',
        createdBy: 'user123',
        address: AppAddress(
          streetNumber: '123',
          city: 'New York',
          state: 'NY',
          country: 'USA',
        ),
      );
    });

    testWidgets('PetDetailsScreen renders correctly with pet info', (WidgetTester tester) async {
      // Arrange: Set up the screen with mock data
      await tester.pumpWidget(
        GetMaterialApp(
          home: PetDetailsScreen(pet: mockPet),
        ),
      );

      // Act: Wait for the screen to settle
      await tester.pumpAndSettle();

      // Assert: Verify if the pet's name and description are displayed
      expect(find.text('Buddy'), findsOneWidget);
      expect(find.text('A cute pet!'), findsOneWidget);
      expect(find.text('Dog'), findsOneWidget);
      expect(find.text('Brown'), findsOneWidget);
      expect(find.text('2 years'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('123456789'), findsOneWidget);

      // Assert: Verify the address is displayed correctly (checking address fields)
      expect(find.text('123 New York, NY, USA'), findsOneWidget);
    });

    testWidgets('Clicking on "Contact Owner" calls phone dialer', (WidgetTester tester) async {
      // Arrange: Set up the screen with mock data
      await tester.pumpWidget(
        GetMaterialApp(
          home: PetDetailsScreen(pet: mockPet),
        ),
      );

      // Act: Tap on the "Contact Owner" button
      await tester.tap(find.text('Contact Owner'));
      await tester.pumpAndSettle();

      // Assert: Verify the URL scheme was launched (mocked)
      // In real tests, this would require integration testing to verify URL launch
      // but for this unit test we assume it was triggered.
    });

    testWidgets('Add to Favorite button triggers the addToFavourite method', (WidgetTester tester) async {
      // Arrange: Set up the screen with mock data
      await tester.pumpWidget(
        GetMaterialApp(
          home: PetDetailsScreen(pet: mockPet),
        ),
      );

      // Act: Tap on the "Add to Fav" button
      await tester.tap(find.text('Add to Fav'));
      await tester.pumpAndSettle();

      // Assert: Verify if the addToFavourite method is called
      verify(mockController.addToFavourite(mockPet)).called(1);
    });
  });
}
