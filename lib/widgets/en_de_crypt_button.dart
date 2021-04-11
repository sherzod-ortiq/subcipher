import 'package:flutter/material.dart';

class EnDeCryptButton extends StatelessWidget {
  final Function handleAction;
  final String title;

  EnDeCryptButton(this.handleAction, this.title);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () => handleAction(),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo[800],
      ),
    );
  }
}
