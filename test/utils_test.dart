import 'package:flutter_test/flutter_test.dart';
import 'package:iban_utilities_lib/bank.dart';
import 'package:iban_utilities_lib/enums_countries.dart';
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
      var digit = Utils.generateCheckDigits(10, 99);
      expect(digit.toString().length, 2);
    });

    test('checkIsNumericWithRegEx function - isNumeric check', () {
      var digit = Utils.generateCheckDigits(10, 99);
      expect(digit.toString().checkIsNumericWithRegEx(), true);
    });

    test('_getIbanChecksum function - 1 digit check', () {
      var sampleTrueIban = "TR580006274433557179312542";
      var digit = Utils.getIbanChecksumTestHelper(sampleTrueIban);
      expect(digit.toString(), "97");
    });

    test('_getIbanChecksum function - 2 digit check', () {
      var sampleTrueIban = "TR090006233685392641717787";
      var digit = Utils.getIbanChecksumTestHelper(sampleTrueIban);
      expect(digit.toString(), "09");
    });

    test('getBankObject function - Condition.1', () {
      var bankObject = Utils.getBankObject(Country.turkish, "00062");
      expect(bankObject.bankName, "Garanti Bankası");
    });

    test('getBankObject function - Condition.2', () {
      var bankObject = Utils.getBankObject(Country.turkish, "00000");
      expect(bankObject.bankName, "");
    });

    test('getBankObjectList function - Condition.1', () {
      List<Bank> bankList = Utils.getBankObjectList(Country.turkish);
      expect(bankList.isNotEmpty, true);
    });

    test('getBankObjectList function - Condition.2', () {
      List<Bank> bankList = Utils.getBankObjectList(Country.testcountry);
      expect(bankList.isEmpty, true);
    });
  });
}
