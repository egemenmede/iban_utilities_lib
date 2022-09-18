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
          return "";
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
          return "";
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
          return "";
        }
    }
  }

  String getBranchCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return "";
        }

      case Country.england:
        {
          return "";
        }

      case Country.germany:
        {
          return "";
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
          return "";
        }
    }
  }

  String getSortCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return "";
        }

      case Country.england:
        {
          return prepareIban().substring(8, 14);
        }

      case Country.germany:
        {
          return "";
        }

      case Country.france:
        {
          return "";
        }

      case Country.italy:
        {
          return "";
        }

      default:
        {
          return "";
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
          return "";
        }

      case Country.germany:
        {
          return "";
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
          return "";
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
          return "";
        }
    }
  }
  // Global
  String prepareIban() {
    return replaceAll(' ', '').toUpperCase();
  }
}

extension ValidatorExtensions on String {
  // Global
  bool checkIsAlphaNumericWithRegEx() {
    return contains(RegExp(r'^([A-Z0-9]*)$'));
  }
  // Global
  bool checkIsAlphaWithRegEx() {
    return contains(RegExp(r'^([A-Z]*)$'));
  }
  // Global
  bool checkIsNumericWithRegEx() {
    final numericRegex = RegExp(r'^([0-9]*)$');
    return numericRegex.hasMatch(this);
  }

  // Private
  bool checkIbanMod97Algorithm(Country country){
    List<String> strArr =  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    List<String> intArr =  ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"];

    switch (country) {
      case Country.turkish:
        {
          var iban = substring(4) + substring(0, 4);

          for (int i = 0; i < strArr.length; i++){
            iban = iban.replaceAll(strArr[i], intArr[i]);
          }

          var ibanInt = BigInt.parse(iban);
          var remainder = ibanInt.remainder(BigInt.from(97)).toInt();
          return (remainder == 1) ? true : false;
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
              || !iban.checkIsAlphaNumericWithRegEx()
              || !iban.getCountryCode(country).checkIsAlphaWithRegEx()
              || iban.getCountryCode(country) != "TR"
              //|| !iban.getNationalCheckDigit(country).checkIsNumeric()
              //|| iban.getNationalCheckDigit(country) != "0"
              || !iban.checkIbanMod97Algorithm(country)
          ) ? false : true;
        }

      default:
        {
          return false;
        }
    }
  }
}