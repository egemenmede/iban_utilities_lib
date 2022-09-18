import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/utils.dart';

void main() {
  group("Utils Functions Test", () {
    test('generateRandomUpperCaseAlpha function - Length check', () {
      var digit = Utils.generateRandomUpperCaseAlpha(5);
      expect(digit.length, 5);
    });
  });
}