import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/extensions.dart';

void main() {
  group("StringExtensions Test", () {
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

    test('getBranchCode Other Country check - Condition.1', () {
      var sampleTrueIban = "IT60 X054 2811 1010 0000 0123 456";
      var testArguman = sampleTrueIban.getBranchCode(Country.italy);
      expect("11101", testArguman);
    });

    test('getBranchCode Other Country check - Condition.2', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getBranchCode(Country.testcountry);
      expect("", testArguman);
    });

    test('getSortCode check - Condition.1', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      var testArguman = sampleTrueIban.getSortCode(Country.testcountry);
      expect("", testArguman);
    });

    test('getSortCode check - Condition.2', () {
      var sampleTrueIban = "GB29 NWBK 6016 1331 9268 19";
      var testArguman = sampleTrueIban.getSortCode(Country.england);
      expect("601613", testArguman);
    });

    // TODO: getNationalCheckDigit
    // TODO: getBankAccountNumber
    // TODO: prepareIban
  });

  group("ValidatorExtensions Test", () {
    test('checkIsAlphaNumericWithRegEx check - Condition.1', () {
      expect("ABCDE".checkIsAlphaNumericWithRegEx(), true);
    });

    test('checkIsAlphaNumericWithRegEx check - Condition.2', () {
      expect("12345".checkIsAlphaNumericWithRegEx(), true);
    });

    test('checkIsAlphaNumericWithRegEx check - Condition.3', () {
      expect("1BC45".checkIsAlphaNumericWithRegEx(), true);
    });

    test('checkIsAlphaNumericWithRegEx check - Condition.4', () {
      expect("1bc45".checkIsAlphaNumericWithRegEx(), false);
    });

    test('checkIsAlphaNumericWithRegEx check - Condition.5', () {
      expect("1Bc45".checkIsAlphaNumericWithRegEx(), false);
    });

    test('checkIsAlphaWithRegEx check - Condition.1', () {
      expect("ABCDE".checkIsAlphaWithRegEx(), true);
    });

    test('checkIsAlphaWithRegEx check - Condition.2', () {
      expect("12345".checkIsAlphaWithRegEx(), false);
    });

    test('checkIsAlphaWithRegEx check - Condition.3', () {
      expect("12AB5".checkIsAlphaWithRegEx(), false);
    });

    test('checkIsAlphaWithRegEx check - Condition.4', () {
      expect("12ab5".checkIsAlphaWithRegEx(), false);
    });

    test('checkIsAlphaWithRegEx check - Condition.5', () {
      expect("AB_DE".checkIsAlphaWithRegEx(), false);
    });

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

    // TODO: checkIbanMod97Algorithm
    // TODO: ibanValidate
  });
}
