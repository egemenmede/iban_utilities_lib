import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/country_enums.dart';
import 'package:iban_utilities/iban_utilities.dart';

void main() {
  group("Sections of Turkish IBAN Check", () {
    var sampleIban = "TR33 0006 1005 1978 6457 8413 26";
    final ibanUtilities = IbanUtilities(sampleIban);

    test('Turkish countryCode check', () {
      expect(ibanUtilities.countryCode(Country.turkish), "TR");
    });

    test('Turkish checkDigits check', () {
      expect(ibanUtilities.checkDigits(Country.turkish), "33");
    });

    test('Turkish bankCode check', () {
      expect(ibanUtilities.bankCode(Country.turkish), "00061");
    });

    test('Turkish sortCode check', () {
      expect(ibanUtilities.sortCode(Country.turkish), "");
    });

    test('Turkish nationalCheckDigit check', () {
      expect(ibanUtilities.nationalCheckDigit(Country.turkish), "0");
    });

    test('Turkish bankAccountNumber check', () {
      expect(ibanUtilities.bankAccountNumber(Country.turkish), "0519786457841326");
    });
  });

  group("Sections of United Kingdom IBAN Check", () {
    var sampleIban = "GB29 NWBK 6016 1331 9268 19";
    final ibanUtilities = IbanUtilities(sampleIban);

    test('United Kingdom countryCode check', () {
      expect(ibanUtilities.countryCode(Country.england), "GB");
    });

    test('United Kingdom checkDigits check', () {
      expect(ibanUtilities.checkDigits(Country.england), "29");
    });

    test('United Kingdom bankCode check', () {
      expect(ibanUtilities.bankCode(Country.england), "NWBK");
    });

    test('United Kingdom sortCode check', () {
      expect(ibanUtilities.sortCode(Country.england), "601613");
    });

    test('United Kingdom nationalCheckDigit check', () {
      expect(ibanUtilities.nationalCheckDigit(Country.england), "");
    });

    test('United Kingdom bankAccountNumber check', () {
      expect(ibanUtilities.bankAccountNumber(Country.england), "31926819");
    });
  });

  group("Sections of Germany IBAN Check", () {
    var sampleIban = "DE89 3704 0044 0532 0130 00";
    final ibanUtilities = IbanUtilities(sampleIban);

    test('Germany countryCode check', () {
      expect(ibanUtilities.countryCode(Country.germany), "DE");
    });

    test('Germany checkDigits check', () {
      expect(ibanUtilities.checkDigits(Country.germany), "89");
    });

    test('Germany bankCode check', () {
      expect(ibanUtilities.bankCode(Country.germany), "37040044");
    });

    test('Germany sortCode check', () {
      expect(ibanUtilities.sortCode(Country.germany), "");
    });

    test('Germany nationalCheckDigit check', () {
      expect(ibanUtilities.nationalCheckDigit(Country.germany), "");
    });

    test('Germany bankAccountNumber check', () {
      expect(ibanUtilities.bankAccountNumber(Country.germany), "0532013000");
    });
  });
}
