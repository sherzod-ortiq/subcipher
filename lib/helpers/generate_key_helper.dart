class GenerateKeyHelper {
  static String generateKey(String chars) {
    final List<String> charsList = chars.toLowerCase().split('');
    final List<String> charsListShuffled = chars.toLowerCase().split('');
    String keyPairs = '';
    charsListShuffled.shuffle();

    for (int i = 0; i < charsList.length; i++) {
      keyPairs += "${charsList[i]} ${charsListShuffled[i]}\n";
    }
    return keyPairs;
  }

  static Map<String, String> getKey(String keyString, {bool decrypt = false}) {
    final int keyIndex = decrypt ? 2 : 0;
    final int valIndex = decrypt ? 0 : 2;
    final Map<String, String> keyMap = Map();
    final List<String> keyPairs = keyString.split('\n');
    keyPairs.removeLast();
    keyPairs
        .forEach((keyPair) => {keyMap[keyPair[keyIndex]] = keyPair[valIndex]});
    return keyMap;
  }
}
