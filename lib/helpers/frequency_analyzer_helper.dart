class FrequencyAnalyzerHelper {
  static Map<String, int> findCharFrequency(String chars, String text) {
    final List<String> charSet = chars.split('');
    final List<String> textChars = text.split('');
    late final Map<String, int> charFrequency = Map();
    late final Map<String, int> sortedCharFrequency;

    charSet.forEach((char) {
      charFrequency[char] =
          textChars.where((textChar) => textChar == char).length;
    });

    var sortedEntries = charFrequency.entries.toList()
      ..sort((fr1, fr2) {
        return fr2.value.compareTo(fr1.value);
      });

    sortedCharFrequency = Map<String, int>.fromEntries(sortedEntries);
    return sortedCharFrequency;
  }
}
