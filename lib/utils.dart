import 'dart:math';

import 'package:iban_utilities_lib/bank.dart';
import 'package:iban_utilities_lib/enums_countries.dart';

class Utils {
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
  /// Private _getIbanChecksum metodu için TestHelper metodu.
  static String getIbanChecksumTestHelper(String str){
    return _getIbanChecksum(str);
  }

  /// Verilen bilgilere göre Iban Kontrol Numarasını geri döndürür.
  static String _getIbanChecksum(String str) {
    List<String> strArr = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];
    List<String> intArr = [
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30",
      "31",
      "32",
      "33",
      "34",
      "35"
    ];

    var iban = str.substring(4) + str.substring(0, 4);

    for (int i = 0; i < strArr.length; i++) {
      iban = iban.replaceAll(strArr[i], intArr[i]);
    }

    var ibanInt = BigInt.parse(iban);
    var remainder = ibanInt.remainder(BigInt.from(97)).toInt();
    var temp = "";
    ((98 - remainder).toString().length == 1)
        ? temp = "0${98 - remainder}"
        : temp = (98 - remainder).toString();
    return temp;
  }

  /// Ülkeye göre banka listesinden, banka kodu döndürür.
  static String generateBankCode(Country country) {
    switch (country) {
      case Country.turkish:
        {
          List<Bank> bankListTR = getBankObjectList(country);

          final Random random = Random.secure();
          var bank = bankListTR[random.nextInt(bankListTR.length)];

          return bank.bankCode;
        }

      default:
        {
          return "00061";
        }
    }
  }

  /// Ülkeye ve banka koduna göre bir Bank nesnesi döndürür.
  static Bank getBankObject(Country country, String activeBankCode) {
    List<Bank> bankObjectList = getBankObjectList(country).where((element) => element.bankCode == activeBankCode).toList();
    Bank bankObj;
    if (bankObjectList.isNotEmpty) {
      bankObj = bankObjectList[0];
    }else{
      bankObj = Bank("","","");
    }

    return bankObj;
  }

  /// Ülkeye göre Banka Kodu, Banka İsmi ve Banka Resim ismini List<Bank> döndürür. Yoksa boş Array döndürür.
  static List<Bank> getBankObjectList(Country country) {
    switch (country) {
      case Country.turkish:
        {
          List<Bank> bankListTR = [
            Bank("00209", "Ziraat Katılım Bankası", "ziraat-katilim-bankasi"),
            Bank("00206", "Türkiye Finans", "turkiye-finans"),
            Bank("00205", "Kuveyt Türk", "kuveyt-turk"),
            Bank("00203", "Albaraka Türk", "albaraka-turk"),
            Bank("00146", "Odea Bank", "odea-bank"),
            Bank("00143", "Aktif Bank", "aktif-yatirim-bankasi"),
            Bank("00142", "BankPozitif", "bankpozitif"),
            Bank("00135", "Anadolu Bank", "anadolu-bank"),
            Bank("00134", "Denizbank", "denizbank"),
            Bank("00125", "Burgan Bank", "burgan-bank"),
            Bank("00124", "ABank", "alternatif-bank"),
            Bank("00123", "HSBC", "hsbc"),
            Bank("00111", "Finansbank", "finansbank"),
            Bank("00109", "Tekstilbank", "tekstil-bankasi"),
            Bank("00108", "T-Bank", "turkland-bank"),
            Bank("00103", "Fibabanka", "fibabanka"),
            Bank("00100", "Adabank", "adabank"),
            Bank("00099", "ING Bank", "ing-bank"),
            Bank("00096", "Turkish Bank", "turkish-bank"),
            Bank("00092", "Citibank", "citibank"),
            Bank("00091", "A&T Bank", "arap-turk-bankasi"),
            Bank("00071", "Fortis", "fortis"),
            Bank("00067", "Yapı ve Kredi Bankası", "yapi-ve-kredi-bankasi"),
            Bank("00064", "İş Bankası", "is-bankasi"),
            Bank("00062", "Garanti Bankası", "garanti-bankasi"),
            Bank("00059", "Şekerbank", "sekerbank"),
            Bank("00046", "Akbank", "akbank"),
            Bank("00032", "Türk Ekonomi Bankası (TEB)", "turk-ekonomi-bankasi"),
            Bank("00015", "VakıfBank", "vakiflar-bankasi"),
            Bank("00012", "Halkbank", "halkbank"),
            Bank("00010", "Ziraat Bankası", "ziraat-bankasi"),
          ];

          return bankListTR;
        }

      default:
        {
          return [];
        }
    }
  }

  /// Bir Iban numarasını oluşturarak geri döndürür.
  static String generateIban(Country country) {
    String bankCode = generateBankCode(country);
    switch (country) {
      case Country.turkish:
        {
          String lastPart = Utils.generateRandomNumeric(16);
          //print("----------------------------------");
          //print("lastPart(16): ${lastPart.length}");
          String template = _getIbanChecksum("TR00${bankCode}0$lastPart");
          //print("template(2): $template");
          var newIban = "TR$template${bankCode}0$lastPart";
          //print("newIban: $newIban");
          //print("----------------------------------");
          return newIban;
        }

      default:
        {
          return "Generate sırasında bir hata oluştu.";
        }
    }
  }
}
