class Utils {
  Utils._();

  static String removeWhitespace(String iban) {
    return iban.replaceAll(' ', '');
  }
}