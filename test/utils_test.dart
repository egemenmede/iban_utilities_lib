import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities_lib/extensions.dart';
import 'package:iban_utilities_lib/utils.dart';

void main() {
  group("Utils Functions Test", () {
    test('generateRandomUpperCaseAlpha function - Length check', () {
      var digit = Utils.generateRandomUpperCaseAlpha(5);
      expect(digit.length, 5);
    });

    test('generateRandomUpperCaseAlpha function - IsAlpha check', () {
      var digit = Utils.generateRandomUpperCaseAlpha(5);
      expect(digit.toString().checkIsAlphaWithRegEx(), true);
    });

    test('generateCheckDigits function - Length check', () {
      var digit = Utils.generateCheckDigits(10,99);
      expect(digit.toString().length, 2);
    });

    test('checkIsNumericWithRegEx function - isNumeric check', () {
      var digit = Utils.generateCheckDigits(10,99);
      expect(digit.toString().checkIsNumericWithRegEx(), true);
    });
  });
}