import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/extensions.dart';

void main() {
  group("Extensions Test", () {
    test('getCountryCode Other Country check', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getCountryCode(Country.testcountry);
      expect("", testArguman);
    });

    test('getCheckDigits Other Country check', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getCheckDigits(Country.testcountry);
      expect("", testArguman);
    });

    test('getBankCode Other Country check', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getBankCode(Country.testcountry);
      expect("", testArguman);
    });
  });

  group("checkIsNumericWithRegEx All Variation Test", () {
    test('checkIsNumericWithRegEx check - Condition.1', () {
      expect("12345".checkIsNumericWithRegEx(), true);
    });

    test('checkIsNumericWithRegEx check - Condition.2', () {
      expect("12345a".checkIsNumericWithRegEx(), false);
    });

    test('checkIsNumericWithRegEx check - Condition.3', () {
      expect("012345".checkIsNumericWithRegEx(), true);
    });

    test('checkIsNumericWithRegEx check - Condition.4', () {
      expect("-12345".checkIsNumericWithRegEx(), false);
    });

    test('checkIsNumericWithRegEx check - Condition.5', () {
      expect("1.23".checkIsNumericWithRegEx(), false);
    });

    test('checkIsNumericWithRegEx check - Condition.6', () {
      expect("1.23f".checkIsNumericWithRegEx(), false);
    });
  });

  group("getSortCode All Variation Test", () {
    test('getSortCode check - Condition.1', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getSortCode(Country.testcountry);
      expect("", testArguman);
    });
  });

  group("getSortCode All Variation Test", () {
    test('getSortCode check - Condition.2', () {
      var sampleTrueIban = "GB29 NWBK 6016 1331 9268 19";
      var testArguman = sampleTrueIban.getSortCode(Country.england);
      expect("601613", testArguman);
    });
  });
}
