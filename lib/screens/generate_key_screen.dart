import 'package:flutter/material.dart';

import '../services/local_storage_service.dart';
import '../helpers/generate_key_helper.dart';

class GenerateKeyScreen extends StatefulWidget {
  final String title;

  GenerateKeyScreen({this.title = ""});

  @override
  _GenerateKeyScreenState createState() => _GenerateKeyScreenState();
}

class _GenerateKeyScreenState extends State<GenerateKeyScreen> {
  late final TextEditingController _charsController;
  late final TextEditingController _keyController;
  String keys = '';

  @override
  void initState() {
    super.initState();

    _charsController = TextEditingController();
    _keyController = TextEditingController();
  }

  Future<void> _generateKey() async {
    final enteredChars = _charsController.text;
    LocalStorageService().writeChars("chars.txt", enteredChars);
    final String fileContent =
        await LocalStorageService().readChars("chars.txt");
    setState(() {
      _keyController.text = GenerateKeyHelper.generateKey(fileContent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Enter chars for encryption key',
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
                controller: _charsController,
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[800],
                  ),
                ),
                ElevatedButton(
                  child: Text('Generate key'),
                  onPressed: _generateKey,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[800],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Encryption key',
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
                controller: _keyController,
                maxLines: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[800],
                  ),
                ),
                ElevatedButton(
                  child: Text('Generate key'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
