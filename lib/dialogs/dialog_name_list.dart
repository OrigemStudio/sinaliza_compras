import 'package:flutter/material.dart';

class DialogNameList extends StatelessWidget {

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('TextField in Dialog'),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: "TextField in Dialog"),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
