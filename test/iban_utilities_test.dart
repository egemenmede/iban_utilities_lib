import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/iban_utilities.dart';

void main() {
  group("Sections of Turkish IBAN Test", () {
    var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

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

  group("Sections of United Kingdom IBAN Test", () {
    var sampleTrueIban = "GB29 NWBK 6016 1331 9268 19";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

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

  group("Sections of Germany IBAN Test", () {
    var sampleTrueIban = "DE89 3704 0044 0532 0130 00";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

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

  group("Sections of France IBAN Test", () {
    var sampleTrueIban = "FR14 2004 1010 0505 0001 3M02 606";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('France countryCode check', () {
      expect(ibanUtilities.countryCode(Country.france), "FR");
    });

    test('France checkDigits check', () {
      expect(ibanUtilities.checkDigits(Country.france), "14");
    });

    test('France bankCode check', () {
      expect(ibanUtilities.bankCode(Country.france), "20041");
    });

    test('France branchCode check', () {
      expect(ibanUtilities.branchCode(Country.france), "01005");
    });

    test('France nationalCheckDigit check', () {
      expect(ibanUtilities.nationalCheckDigit(Country.france), "06");
    });

    test('France bankAccountNumber check', () {
      expect(ibanUtilities.bankAccountNumber(Country.france), "0500013M026");
    });
  });

  group("Sections of Italy IBAN Test", () {
    var sampleTrueIban = "IT60 X054 2811 1010 0000 0123 456";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('Italy countryCode check', () {
      expect(ibanUtilities.countryCode(Country.italy), "IT");
    });

    test('Italy checkDigits check', () {
      expect(ibanUtilities.checkDigits(Country.italy), "60");
    });

    test('Italy bankCode check', () {
      expect(ibanUtilities.bankCode(Country.italy), "05428");
    });

    test('Italy branchCode check', () {
      expect(ibanUtilities.branchCode(Country.italy), "11101");
    });

    test('Italy nationalCheckDigit check', () {
      expect(ibanUtilities.nationalCheckDigit(Country.italy), "X");
    });

    test('Italy bankAccountNumber check', () {
      expect(ibanUtilities.bankAccountNumber(Country.italy), "000000123456");
    });
  });

  group("Turkish IBAN Validate Test", () {
    test('Turkish True IBAN Validate Check', () {
      var sampleTrueIban = "TR33 0006 1005 1978 6457 8413 26";
      final ibanUtilities = IbanUtilities(sampleTrueIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), true);
    });

    test('Turkish False IBAN Validate Check - Condition.1', () {
      // İlk 2 harf olmalı
      var sampleFalseIban = "4433 0006 1005 1978 6457 8413 26";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });

    test('Turkish False IBAN Validate Check - Condition.2', () {
      // İlk 2 harf hatalı
      var sampleFalseIban = "EM33 0006 1005 1978 6457 8413 26";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });

    test('Turkish False IBAN Validate Check - Condition.3', () {
      // Toplam uzunluğu 26 karakter olmalı.
      var sampleFalseIban = "TR33 0006 1005 1978 6457 8413 2";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });

    test('Turkish False IBAN Validate Check - Condition.4', () {
      // Boş olmamalı olmalı.
      var sampleFalseIban = "";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });

    test('Turkish True IBAN Validate Check - Condition.5', () {
      // Iban numarası Alfanümerik olmalı.
      var sampleFalseIban = "TR33 0006 1005 1978 6457 8413_26";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), true);
    });

    test('Turkish False IBAN Validate Check - Condition.6', () {
      // Iban numarası 10. karakteri sayı olmalı.
      var sampleFalseIban = "TR33 0006 1X05 1978 6457 8413 26";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });

    test('Turkish False IBAN Validate Check - Condition.7', () {
      // Iban numarası 10. karakteri sayı fakat sadece sıfır olmalı.
      var sampleFalseIban = "TR33 0006 1205 1978 6457 8413 26";
      final ibanUtilities = IbanUtilities(sampleFalseIban);
      expect(ibanUtilities.ibanValidate(Country.turkish), false);
    });
  });

  group("Generate Turkish IBAN Validate Test", () {
    test('Generate IBAN Validate Check', () {
      final ibanUtilities = IbanUtilities.generateIban(Country.turkish);
      expect(ibanUtilities.ibanValidate(Country.turkish), true);
    });
  });

  /*
  group("United Kingdom IBAN Validate Test", () {
    var sampleTrueIban = "GB29 NWBK 6016 1331 9268 19";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('United Kingdom IBAN Validate Check', () {
      expect(ibanUtilities.ibanValidate(Country.england), true);
    });
  });

  group("Germany IBAN Validate Test", () {
    var sampleTrueIban = "DE89 3704 0044 0532 0130 00";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('Germany IBAN Validate Check', () {
      expect(ibanUtilities.ibanValidate(Country.germany), true);
    });
  });

  group("France IBAN Validate Test", () {
    var sampleTrueIban = "FR14 2004 1010 0505 0001 3M02 606";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('France IBAN Validate Check', () {
      expect(ibanUtilities.ibanValidate(Country.france), true);
    });
  });

  group("Italy IBAN Validate Test", () {
    var sampleTrueIban = "IT60 X054 2811 1010 0000 0123 456";
    final ibanUtilities = IbanUtilities(sampleTrueIban);

    test('Italy IBAN Validate Check', () {
      expect(ibanUtilities.ibanValidate(Country.italy), true);
    });
  });
   */

}
