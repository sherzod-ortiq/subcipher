import 'package:flutter/material.dart';

import '../services/local_storage_service.dart';
import '../helpers/generate_key_helper.dart';
import '../helpers/encryption_helper.dart';
import '../widgets/main_drawer.dart';
import '../widgets/save_button.dart';
import '../widgets/en_de_crypt_button.dart';

class PerformSubstitutionScreen extends StatefulWidget {
  static const routeName = '/perform-substitution';
  final String title;

  PerformSubstitutionScreen({this.title = ""});

  @override
  _PerformSubstitutionScreenState createState() =>
      _PerformSubstitutionScreenState();
}

class _PerformSubstitutionScreenState extends State<PerformSubstitutionScreen> {
  late final TextEditingController _rawTextController;
  late final TextEditingController _processedTextController;
  String keys = '';

  @override
  void initState() {
    super.initState();

    _rawTextController = TextEditingController();
    _processedTextController = TextEditingController();

    _initializeRawText();
    _initializeProcessedText();
  }

  @override
  void dispose() {
    _rawTextController.dispose();
    _processedTextController.dispose();
    super.dispose();
  }

  Future<void> _encryptText({bool decrypt = false}) async {
    final String rawKey = await LocalStorageService().readChars("key.txt");
    final Map<String, String> mapKey =
        GenerateKeyHelper.getKey(rawKey, decrypt: decrypt);
    setState(() {
      _processedTextController.text =
          EncryptionHelper.encrypt(_rawTextController.text, mapKey);
    });
  }

  Future<void> _saveRawText() async {
    final rawText = _rawTextController.text;
    LocalStorageService().writeChars("raw_text.txt", rawText);
  }

  Future<void> _saveEncryptText() async {
    final encryptedText = _processedTextController.text;
    LocalStorageService().writeChars("encrypted_text.txt", encryptedText);
  }

  Future<void> _initializeRawText() async {
    _rawTextController.text =
        await LocalStorageService().readChars("raw_text.txt");
  }

  Future<void> _initializeProcessedText() async {
    _processedTextController.text =
        await LocalStorageService().readChars("encrypted_text.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Enter text to en/de-crypt',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                controller: _rawTextController,
                maxLines: 6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SaveButton(_saveRawText),
                EnDeCryptButton(_encryptText, 'Encrypt'),
                EnDeCryptButton(() => _encryptText(decrypt: true), 'Decrypt'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Output text',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                controller: _processedTextController,
                maxLines: 6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SaveButton(_saveEncryptText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
