import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/utils.dart';

extension StringExtensions on String {
  String getCountryCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(0, 2);
        }

      case Country.england:
        {
          return prepareIban().substring(0, 2);
        }

      case Country.germany:
        {
          return prepareIban().substring(0, 2);
        }

      case Country.france:
        {
          return prepareIban().substring(0, 2);
        }

      case Country.italy:
        {
          return prepareIban().substring(0, 2);
        }

      default:
        {
          return prepareIban().substring(0, 2);
        }
    }
  }

  String getCheckDigits(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(2, 4);
        }

      case Country.england:
        {
          return prepareIban().substring(2, 4);
        }

      case Country.germany:
        {
          return prepareIban().substring(2, 4);
        }

      case Country.france:
        {
          return prepareIban().substring(2, 4);
        }

      case Country.italy:
        {
          return prepareIban().substring(2, 4);
        }

      default:
        {
          return prepareIban().substring(2, 4);
        }
    }
  }

  String getBankCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(4, 9);
        }

      case Country.england:
        {
          return prepareIban().substring(4, 8);
        }

      case Country.germany:
        {
          return prepareIban().substring(4, 12);
        }

      case Country.france:
        {
          return prepareIban().substring(4, 9);
        }

      case Country.italy:
        {
          return prepareIban().substring(5, 10);
        }

      default:
        {
          return prepareIban().substring(4, 9);
        }
    }
  }

  String getBranchCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.england:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.germany:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.france:
        {
          return prepareIban().substring(9, 14);
        }

      case Country.italy:
        {
          return prepareIban().substring(10, 15);
        }

      default:
        {
          return prepareIban().substring(0, 0);
        }
    }
  }

  String getSortCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.england:
        {
          return prepareIban().substring(8, 14);
        }

      case Country.germany:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.france:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.italy:
        {
          return prepareIban().substring(0, 0);
        }

      default:
        {
          return prepareIban().substring(0, 0);
        }
    }
  }

  String getNationalCheckDigit(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(9, 10);
        }

      case Country.england:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.germany:
        {
          return prepareIban().substring(0, 0);
        }

      case Country.france:
        {
          return prepareIban().substring(25, 27);
        }

      case Country.italy:
        {
          return prepareIban().substring(4, 5);
        }

      default:
        {
          return prepareIban().substring(9, 10);
        }
    }
  }

  String getBankAccountNumber(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return prepareIban().substring(10, 26);
        }

      case Country.england:
        {
          return prepareIban().substring(14, 22);
        }

      case Country.germany:
        {
          return prepareIban().substring(12, 22);
        }

      case Country.france:
        {
          return prepareIban().substring(14, 25);
        }

      case Country.italy:
        {
          return prepareIban().substring(15, 27);
        }

      default:
        {
          return prepareIban().substring(10, 26);
        }
    }
  }
  // Global
  String prepareIban() {
    return replaceAll(' ', '').toUpperCase();
  }
  // Global
  String getFirstFourCharacters() {
    return prepareIban().substring(0, 4);
  }
  // Global
  String getAfterTheFirstFourCharacters() {
    return prepareIban().substring(4, length);
  }
  // Global
  String getReverseIban() {
    return prepareIban().getAfterTheFirstFourCharacters()+prepareIban().getFirstFourCharacters();
  }
}

extension ValidatorExtensions on String {
  // Global
  bool checkIsAlphaNumeric() {
    return contains(RegExp('^[A-Z0-9]+'));
  }
  // Global
  bool checkIsAlpha() {
    return contains(RegExp('^[A-Z]+'));
  }
  // Global
  bool checkIsNumeric() {
    return contains(RegExp('^[0-9]+'));
  }
  // Private
  bool _getCheckIbanAlgorithm(Country country){
    List<String> strArr =  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    List<String> intArr =  ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"];

    switch (country) {
      case Country.turkish:
        {
          String tmp = getReverseIban();
          for (int i = 0; i < strArr.length; i++){
            tmp = tmp.replaceAll(strArr[i], intArr[i]);
          }

          double value = double.parse(tmp);
          double mod = value % 97;
          return (mod != 1);
        }

      default:
        {
          return false;
        }
    }
  }

  bool ibanValidate(Country country) {
    var iban = prepareIban();

    switch (country) {
      case Country.turkish:
        {
          return (
              iban.isEmpty
              || iban.length != 26
              || !iban.checkIsAlphaNumeric()
              || !iban.getCountryCode(country).checkIsAlpha()
              || iban.getCountryCode(country) != "TR"
              || !iban.getNationalCheckDigit(country).checkIsNumeric()
              || iban.getNationalCheckDigit(country) != "0"
              || !iban._getCheckIbanAlgorithm(country)
          ) ? false : true;
        }

      default:
        {
          return false;
        }
    }
  }
}

extension GenerateExtensions on String {
  String generateIban(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return "TR${Utils.generateCheckDigits(10,99)}";
        }

      default:
        {
          return prepareIban().substring(0, 0);
        }
    }
  }
}