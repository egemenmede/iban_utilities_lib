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

  bool nationalCheckDigitValidate(Country country, String ibanString) {
    var iban = ibanString.prepareIban();

    switch (country) {
      case Country.turkish:
        {
          return (
              iban.getNationalCheckDigit(country) != "0"
              || !iban.getNationalCheckDigit(country).checkIsNumeric()
          ) ? false : true;
        }

      default:
        {
          return false;
        }
    }
  }

  bool ibanValidate(Country country, String ibanString) {
    var iban = ibanString.prepareIban();

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