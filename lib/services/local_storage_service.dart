import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internall();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internall();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path.toString();
  }

  Future<File> _localFile(fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> writeChars(String fileName, String chars) async {
    final file = await _localFile(fileName);
    return file.writeAsString(chars);
  }

  Future<String> readChars(String fileName) async {
    try {
      final file = await _localFile(fileName);
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // There will be file not found error when the first initialization is run
      // Set file existace check constraint in initialization methods
      return '';
    }
  }
}
