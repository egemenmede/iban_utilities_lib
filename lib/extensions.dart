import 'package:flutter/foundation.dart';
import 'package:iban_utilities/country_enums.dart';

extension StringExtensions on String {
  String countryCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(0, 2);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(0, 2);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(0, 2);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(0, 2);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(0, 2);
        }

      default:
        {
          return replaceAll(' ', '').substring(0, 2);
        }
    }
  }

  String checkDigits(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(2, 4);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(2, 4);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(2, 4);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(2, 4);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(2, 4);
        }

      default:
        {
          return replaceAll(' ', '').substring(2, 4);
        }
    }
  }

  String bankCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(4, 9);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(4, 8);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(4, 12);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(4, 9);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(5, 10);
        }

      default:
        {
          return replaceAll(' ', '').substring(4, 9);
        }
    }
  }

  String branchCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(9, 14);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(10, 15);
        }

      default:
        {
          return replaceAll(' ', '').substring(0, 0);
        }
    }
  }

  String sortCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(8, 14);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      default:
        {
          return replaceAll(' ', '').substring(0, 0);
        }
    }
  }

  String nationalCheckDigit(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(9, 10);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(0, 0);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(25, 27);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(4, 5);
        }

      default:
        {
          return replaceAll(' ', '').substring(9, 10);
        }
    }
  }

  String bankAccountNumber(Country country) {
    switch (country) {
      case Country.turkish:
        {
          return replaceAll(' ', '').substring(10, 26);
        }

      case Country.england:
        {
          return replaceAll(' ', '').substring(14, 22);
        }

      case Country.germany:
        {
          return replaceAll(' ', '').substring(12, 22);
        }

      case Country.france:
        {
          return replaceAll(' ', '').substring(14, 25);
        }

      case Country.italy:
        {
          return replaceAll(' ', '').substring(15, 27);
        }

      default:
        {
          return replaceAll(' ', '').substring(10, 26);
        }
    }
  }
}

extension ValidatorExtensions on String {
  bool ibanValidate(Country country, String iban) {
    switch (country) {
      case Country.turkish:
        {
          return (iban.replaceAll(' ', '').length == 26 && iban.countryCode(country) == "TR") ? true : false;
        }

      case Country.england:
        {
          return (iban.replaceAll(' ', '').length == 22 && iban.countryCode(country) == "GB") ? true : false;
        }

      case Country.germany:
        {
          return (iban.replaceAll(' ', '').length == 22 && iban.countryCode(country) == "DE") ? true : false;
        }

      case Country.france:
        {
          return (iban.replaceAll(' ', '').length == 27 && iban.countryCode(country) == "FR") ? true : false;
        }

      case Country.italy:
        {
          return (iban.replaceAll(' ', '').length == 27 && iban.countryCode(country) == "IT") ? true : false;
        }

      default:
        {
          return false;
        }
    }
  }
}
