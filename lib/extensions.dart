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

      default:
        {
          return replaceAll(' ', '').substring(4, 9);
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

      default:
        {
          return replaceAll(' ', '').substring(10, 26);
        }
    }
  }
}
