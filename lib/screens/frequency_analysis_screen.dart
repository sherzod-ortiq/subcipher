import 'package:flutter/material.dart';
import 'package:subcipher/widgets/en_de_crypt_button.dart';

import '../services/local_storage_service.dart';
import '../helpers/frequency_analyzer_helper.dart';
import '../widgets/main_drawer.dart';
import '../widgets/save_button.dart';

class FrequencyAnalysisScreen extends StatefulWidget {
  static const routeName = '/frequency-analysis';
  final String title;

  FrequencyAnalysisScreen({this.title = ""});

  @override
  _FrequencyAnalysisScreenState createState() =>
      _FrequencyAnalysisScreenState();
}

class _FrequencyAnalysisScreenState extends State<FrequencyAnalysisScreen> {
  late final TextEditingController _analyzeTextController;
  final _processedTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _analyzeTextController = TextEditingController();

    _initializeAnalyzeText();
  }

  @override
  void dispose() {
    _analyzeTextController.dispose();
    super.dispose();
  }

  Future<void> _saveAnalyzeText() async {
    final analyzeText = _analyzeTextController.text;
    LocalStorageService().writeChars("text_for_analysis.txt", analyzeText);
  }

  Future<void> _analyzeText() async {
    final String chars = await LocalStorageService().readChars("chars.txt");

    _processedTextController.text = FrequencyAnalyzerHelper.findCharFrequency(
            chars, _analyzeTextController.text)
        .toString();
  }

  Future<void> _initializeAnalyzeText() async {
    _analyzeTextController.text =
        await LocalStorageService().readChars("text_for_analysis.txt");
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
                'Enter text to analyze',
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
                controller: _analyzeTextController,
                maxLines: 6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SaveButton(_saveAnalyzeText),
                EnDeCryptButton(_analyzeText, 'Analyze text'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Report',
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
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
