import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/models/address/address.dart';

void main() {
  group('AppAddress', () {
    test('should convert AppAddress to JSON correctly', () {
      // Arrange
      final address = AppAddress(
        city: 'New York',
        country: 'USA',
        latitude: 40.7128,
        longitude: -74.0060,
        postalCode: '10001',
        state: 'New York',
        countryCode: 'US',
        streetNumber: '123',
      );

      // Act
      final json = address.toJson();

      // Assert
      expect(json, {
        'city': 'New York',
        'country': 'USA',
        'latitude': 40.7128,
        'longitude': -74.006,
        'postalCode': '10001',
        'state': 'New York',
        'countryCode': 'US',
        'streetNumber': '123',
      });
    });

    test('should create AppAddress from JSON correctly', () {
      // Arrange
      final json = {
        'city': 'New York',
        'country': 'USA',
        'latitude': 40.7128,
        'longitude': -74.006,
        'postalCode': '10001',
        'state': 'New York',
        'countryCode': 'US',
        'streetNumber': '123',
      };

      // Act
      final address = AppAddress.fromJson(json);

      // Assert
      expect(address.city, 'New York');
      expect(address.country, 'USA');
      expect(address.latitude, 40.7128);
      expect(address.longitude, -74.006);
      expect(address.postalCode, '10001');
      expect(address.state, 'New York');
      expect(address.countryCode, 'US');
      expect(address.streetNumber, '123');
    });

    test('should handle null values correctly in JSON', () {
      // Arrange
      final json = {
        'city': null,
        'country': null,
        'latitude': null,
        'longitude': null,
        'postalCode': null,
        'state': null,
        'countryCode': null,
        'streetNumber': null,
      };

      // Act
      final address = AppAddress.fromJson(json);

      // Assert
      expect(address.city, null);
      expect(address.country, null);
      expect(address.latitude, null);
      expect(address.longitude, null);
      expect(address.postalCode, null);
      expect(address.state, null);
      expect(address.countryCode, null);
      expect(address.streetNumber, null);

      // Convert back to JSON
      final jsonOutput = address.toJson();

      // Assert the output JSON contains null values
      expect(jsonOutput, json);
    });

    test('should compare two AppAddress instances for equality', () {
      // Arrange
      final address1 = AppAddress(
        city: 'New York',
        country: 'USA',
        latitude: 40.7128,
        longitude: -74.006,
        postalCode: '10001',
        state: 'New York',
        countryCode: 'US',
        streetNumber: '123',
      );

      final address2 = AppAddress(
        city: 'New York',
        country: 'USA',
        latitude: 40.7128,
        longitude: -74.006,
        postalCode: '10001',
        state: 'New York',
        countryCode: 'US',
        streetNumber: '123',
      );

      // Act & Assert
      expect(address1.toJson(), address2.toJson());
    });
  });
}
