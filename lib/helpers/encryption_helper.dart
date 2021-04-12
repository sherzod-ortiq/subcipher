class EncryptionHelper {
  static String encrypt(String rawText, Map<String, String> key) {
    final List<String> textChars = rawText.toLowerCase().split('');

    for (int i = 0; i < textChars.length; i++) {
      if (key.keys.contains(textChars[i])) {
        textChars[i] = key[textChars[i]].toString();
      }
    }
    return textChars.join();
  }
}
