import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities_lib/enums_countries.dart';
import 'package:iban_utilities_lib/extensions.dart';

void main() {
  group("StringExtensions Test", () {
    group("getCountryCode Tests", () {
      test('getCountryCode Other Country check', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman = sampleTrueIban.getCountryCode(Country.testcountry);
        expect("", testArguman);
      });
    });

    group("getCheckDigits Tests", () {
      test('getCheckDigits Other Country check', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman = sampleTrueIban.getCheckDigits(Country.testcountry);
        expect("", testArguman);
      });
    });

    group("getBankCode Tests", () {
      test('getBankCode Other Country check', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman = sampleTrueIban.getBankCode(Country.testcountry);
        expect("", testArguman);
      });
    });

    group("getBranchCode Tests", () {
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
    });

    group("getSortCode Tests", () {
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
    });

    group("getNationalCheckDigit Tests", () {
      test('getNationalCheckDigit check - Condition.1', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman =
            sampleTrueIban.getNationalCheckDigit(Country.testcountry);
        expect("", testArguman);
      });

      test('getNationalCheckDigit check - Condition.2', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman = sampleTrueIban.getNationalCheckDigit(Country.turkish);
        expect("0", testArguman);
      });
    });

    group("getBankAccountNumber Tests", () {
      test('getBankAccountNumber check - Condition.1', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman =
            sampleTrueIban.getBankAccountNumber(Country.testcountry);
        expect("", testArguman);
      });

      test('getBankAccountNumber check - Condition.2', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var testArguman = sampleTrueIban.getBankAccountNumber(Country.turkish);
        expect("0519786457841326", testArguman);
      });
    });

    group("prepareIban Tests", () {
      test('prepareIban check - Condition.1', () {
        var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
        var result = sampleTrueIban.prepareIban();
        expect("TR330006100519786457841326", result);
      });

      test('prepareIban check - Condition.2', () {
        var sampleFalseIban = "TR33 0006 1005%1978 6457 8413_26";
        var result = sampleFalseIban.prepareIban();
        expect("TR330006100519786457841326", result);
      });

      test('prepareIban check - Condition.3', () {
        var sampleFalseIban = "tr33 0006 1005%1978 6457 8413_26";
        var result = sampleFalseIban.prepareIban();
        expect("TR330006100519786457841326", result);
      });
    });

    group("toPrintFormat Tests", () {
      test('toPrintFormat check - Condition.1', () {
        var sampleTrueIban = "TR330006100519786457841326";
        var result = sampleTrueIban.toPrintFormat();
        expect("TR33 0006 1005 1978 6457 8413 26", result);
      });

      test('toPrintFormat check - Condition.2', () {
        var sampleTrueIban = "tr330006100519786457841326";
        var result = sampleTrueIban.toPrintFormat();
        expect("TR33 0006 1005 1978 6457 8413 26", result);
      });
    });
  });

  group("ValidatorExtensions Test", () {
    group("checkIsAlphaNumericWithRegEx Test", () {
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
    });

    group("checkIsAlphaWithRegEx Test", () {
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
    });

    group("checkIsNumericWithRegEx Test", () {
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

    group("checkIbanMod97Algorithm Test", () {
      test('checkIbanMod97Algorithm check - Condition.1', () {
        expect(
            "Tr 33 0006 1005 1978 6457 8413 26"
                .checkIbanMod97Algorithm(Country.testcountry),
            false);
      });

      test('checkIbanMod97Algorithm check - Condition.2', () {
        expect(
            "Tr 33 0006 1005 1978 6457 8413 26"
                .checkIbanMod97Algorithm(Country.turkish),
            true);
      });

      test('checkIbanMod97Algorithm check - Condition.3', () {
        expect(
            "Tr 32 0006 1005 1978 6457 8413 26"
                .checkIbanMod97Algorithm(Country.turkish),
            false);
      });
    });

    group("ibanValidate Test", () {
      test('ibanValidate check - Condition.1', () {
        expect(
            "Tr 33 0006 1005 1978 6457 8413 26".ibanValidate(Country.turkish),
            true);
      });

      test('ibanValidate check - Condition.1', () {
        expect(
            "Tr 32 0006 1005 1978 6457 8413 26".ibanValidate(Country.turkish),
            false);
      });

      test('ibanValidate check - Condition.2', () {
        expect(
            "Tr 33 0006 1005 1978 6457 8413 26"
                .ibanValidate(Country.testcountry),
            false);
      });

      test('ibanValidate check - Condition.3', () {
        expect("Tr 33 0006 1005 1978 6457 8413 2".ibanValidate(Country.turkish),
            false);
      });
    });
  });
}
