extension StringExtensions on String {
  String countryCode() {
    return replaceAll(' ', '').substring(0, 2);
  }

  String checkDigits() {
    return replaceAll(' ', '').substring(2, 4);
  }

  String bankCode() {
    return replaceAll(' ', '').substring(4, 9);
  }

  String nationalCheckDigit() {
    return replaceAll(' ', '').substring(9, 10);
  }

  String bankAccountNumber() {
    return replaceAll(' ', '').substring(10, 26);
  }
}