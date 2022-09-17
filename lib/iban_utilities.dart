library iban_utilities;

import 'package:iban_utilities/enums_countries.dart';
import 'package:iban_utilities/extensions.dart';

class IbanUtilities {
  String iban;
  IbanUtilities(this.iban);

  bool ibanValidate(Country country) => iban.ibanValidate(country);

  String countryCode(Country country) => iban.getCountryCode(country);
  String checkDigits(Country country) => iban.getCheckDigits(country);
  String bankCode(Country country) => iban.getBankCode(country);
  String branchCode(Country country) => iban.getBranchCode(country);
  String sortCode(Country country) => iban.getSortCode(country);
  String nationalCheckDigit(Country country) => iban.getNationalCheckDigit(country);
  String bankAccountNumber(Country country) => iban.getBankAccountNumber(country);

  //TODO String generateIban(Country country) => iban.generateIban(country);
}