import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function saveHandler;

  SaveButton(this.saveHandler);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Save'),
      onPressed: () => saveHandler(),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo[800],
      ),
    );
  }
}
