import 'dart:math';

class Utils {
  static final Random _random = Random.secure();

  static int generateCheckDigits(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  static String generateRandomUpperCaseAlpha(int length) {
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final randomString = List.generate(length,
            (index) => availableChars[_random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  static String generateRandomNumeric(int length) {
    const availableChars = '1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[_random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

}
