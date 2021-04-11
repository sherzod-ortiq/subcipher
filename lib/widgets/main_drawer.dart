import 'package:flutter/material.dart';

import '../screens/perform_substitution_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                'Generate key',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(PerformSubstitutionScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                'Perform substitution',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
