library iban_utilities;

import 'package:iban_utilities/country_enums.dart';
import 'package:iban_utilities/extensions.dart';

class IbanUtilities {
  String iban;
  IbanUtilities(this.iban);

  bool ibanValidate(Country country) => iban.ibanValidate(country, iban);
  String countryCode(Country country) => iban.countryCode(country);
  String checkDigits(Country country) => iban.checkDigits(country);
  String bankCode(Country country) => iban.bankCode(country);
  String branchCode(Country country) => iban.branchCode(country);
  String sortCode(Country country) => iban.sortCode(country);
  String nationalCheckDigit(Country country) => iban.nationalCheckDigit(country);
  String bankAccountNumber(Country country) => iban.bankAccountNumber(country);
}