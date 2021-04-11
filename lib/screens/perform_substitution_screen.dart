import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class PerformSubstitutionScreen extends StatefulWidget {
  static const routeName = '/perform-substitution';
  final String title;

  PerformSubstitutionScreen({this.title = ""});

  @override
  _PerformSubstitutionScreenState createState() =>
      _PerformSubstitutionScreenState();
}

class _PerformSubstitutionScreenState extends State<PerformSubstitutionScreen> {
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
                'Enter text to encrypt',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
