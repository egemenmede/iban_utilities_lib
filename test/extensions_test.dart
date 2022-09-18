import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/extensions.dart';

void main() {
  group("Extensions Test", () {
    test('getCountryCode Other Country check', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getCountryCode(Country.testcountry);
      expect("TR", testArguman);
    });
  });
}