import 'package:flutter_test/flutter_test.dart';
import 'package:petagram/models/response/result.dart';

void main() {
  group('Result<T>', () {
    test('should return true for isSuccess when data is not null', () {
      // Arrange
      final result = Result(data: 'Test Data');

      // Act & Assert
      expect(result.isSuccess, true);
      expect(result.isError, false);
      expect(result.data, 'Test Data');
      expect(result.error, null);
    });

    test('should return true for isError when error is not null', () {
      // Arrange
      final result = Result(error: 'Some error occurred');

      // Act & Assert
      expect(result.isSuccess, false);
      expect(result.isError, true);
      expect(result.data, null);
      expect(result.error, 'Some error occurred');
    });

    test('should handle both data and error as null', () {
      // Arrange
      final result = Result();

      // Act & Assert
      expect(result.isSuccess, false);
      expect(result.isError, false);
      expect(result.data, null);
      expect(result.error, null);
    });

    test('should handle generic type correctly', () {
      // Arrange
      final result = Result<int>(data: 42);

      // Act & Assert
      expect(result.isSuccess, true);
      expect(result.data, 42);
      expect(result.error, null);
    });
  });
}
