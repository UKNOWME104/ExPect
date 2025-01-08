import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/models/address/address.dart';
import 'package:petagram/models/user/app_user.dart';

void main() {
  group('AppUser', () {
    test('should convert AppUser to JSON correctly', () {
      // Arrange
      final address = AppAddress(
        city: 'San Francisco',
        country: 'USA',
        latitude: 37.7749,
        longitude: -122.4194,
        postalCode: '94103',
        state: 'California',
        countryCode: 'US',
        streetNumber: '456',
      );

      final user = AppUser(
        id: '123',
        fullName: 'John Doe',
        address: address,
        phone: '+1234567890',
        email: 'john.doe@example.com',
      );

      // Act
      final json = user.toJson();

      // Assert
      expect(json, {
        'id': '123',
        'fullName': 'John Doe',
        'address': address.toJson(),
        'phone': '+1234567890',
        'email': 'john.doe@example.com',
      });
    });

    test('should create AppUser from JSON correctly', () {
      // Arrange
      final json = {
        'id': '123',
        'fullName': 'John Doe',
        'address': {
          'city': 'San Francisco',
          'country': 'USA',
          'latitude': 37.7749,
          'longitude': -122.4194,
          'postalCode': '94103',
          'state': 'California',
          'countryCode': 'US',
          'streetNumber': '456',
        },
        'phone': '+1234567890',
        'email': 'john.doe@example.com',
      };

      // Act
      final user = AppUser.fromJson(json);

      // Assert
      expect(user.id, '123');
      expect(user.fullName, 'John Doe');
      expect(user.address?.city, 'San Francisco');
      expect(user.phone, '+1234567890');
      expect(user.email, 'john.doe@example.com');
    });

    test('should handle null values correctly in JSON', () {
      // Arrange
      final json = {
        'id': null,
        'fullName': 'John Doe',
        'address': null,
        'phone': '+1234567890',
        'email': 'john.doe@example.com',
      };

      // Act
      final user = AppUser.fromJson(json);

      // Assert
      expect(user.id, null);
      expect(user.fullName, 'John Doe');
      expect(user.address, null);
      expect(user.phone, '+1234567890');
      expect(user.email, 'john.doe@example.com');

      // Convert back to JSON
      final jsonOutput = user.toJson();

      // Assert
      expect(jsonOutput, json);
    });

    test('should copy an AppUser object with new values', () {
      // Arrange
      final originalUser = AppUser(
        id: '123',
        fullName: 'John Doe',
        address: null,
        phone: '+1234567890',
        email: 'john.doe@example.com',
      );

      // Act
      final updatedUser = originalUser.copyWith(
        fullName: 'Jane Smith',
        phone: '+0987654321',
      );

      // Assert
      expect(updatedUser.fullName, 'Jane Smith');
      expect(updatedUser.phone, '+0987654321');
      expect(updatedUser.email, originalUser.email);
    });
  });
}
