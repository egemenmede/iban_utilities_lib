import 'dart:math';

import 'package:iban_utilities/enums_countries.dart';

class Utils {
  Utils._();

  static final Random _random = Random.secure();

  /// Verilen iki rakam arasında random sayı döndürür.
  static int generateCheckDigits(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  /// A-Z arasındaki büyük harflerden istenilen uzunlukta random bir metin döndürür.
  static String generateRandomUpperCaseAlpha(int length) {
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final randomString = List.generate(length,
            (index) => availableChars[_random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  /// 0-9 arasındaki rakamlardan istenilen uzunlukta random bir metin döndürür.
  static String generateRandomNumeric(int length) {
    const availableChars = '1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[_random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  /// Verilen bilgilere göre Iban Kontrol Numarasını geri döndürür.
  static String _getIbanChecksum(String str){
    List<String> strArr =  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    List<String> intArr =  ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"];

    var iban = str.substring(4) + str.substring(0, 4);

    for (int i = 0; i < strArr.length; i++){
      iban = iban.replaceAll(strArr[i], intArr[i]);
    }

    var ibanInt = BigInt.parse(iban);
    var remainder = ibanInt.remainder(BigInt.from(97)).toInt();
    return (98-remainder).toString();
  }

  /// Bir Iban numarasını oluşturarak geri döndürür.
  static String generateIban(Country country) {
    String staticSampleBankCode = "00062";
    switch (country) {
      case Country.turkish:
        {
          String lastPart = Utils.generateRandomNumeric(16);
          String template =  _getIbanChecksum("TR00${staticSampleBankCode}0$lastPart");
          var newIban = "TR$template${staticSampleBankCode}0$lastPart";
          // print("newIban: $newIban");
          return newIban;
        }

      default:
        {
          return "Generate sırasında bir hata oluştu.";
        }
    }
  }
}
