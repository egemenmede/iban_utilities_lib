library iban_utilities_lib;

import 'package:iban_utilities_lib/enums_countries.dart';
import 'package:iban_utilities_lib/extensions.dart';
import 'package:iban_utilities_lib/utils.dart';

class IbanUtilities {
  late String iban;
  IbanUtilities(this.iban);
  IbanUtilities.generateIban(Country country) {
    iban = Utils.generateIban(country);
  }

  bool ibanValidate(Country country) => iban.ibanValidate(country);

  String countryCode(Country country) => iban.getCountryCode(country);
  String checkDigits(Country country) => iban.getCheckDigits(country);
  String bankCode(Country country) => iban.getBankCode(country);
  String branchCode(Country country) => iban.getBranchCode(country);
  String sortCode(Country country) => iban.getSortCode(country);
  String nationalCheckDigit(Country country) =>
      iban.getNationalCheckDigit(country);
  String bankAccountNumber(Country country) =>
      iban.getBankAccountNumber(country);
}
