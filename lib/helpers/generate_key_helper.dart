class GenerateKeyHelper {
  static String generateKey(String chars) {
    final List<String> charsList = chars.split('');
    final List<String> charsListShuffled = chars.split('');
    String keyPairs = '';
    charsListShuffled.shuffle();

    for (int i = 0; i < charsList.length; i++) {
      keyPairs += "${charsList[i]} ${charsListShuffled[i]}\n";
    }
    return keyPairs;
  }
}
