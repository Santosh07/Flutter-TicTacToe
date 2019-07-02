import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback voidCallback;

  CustomDialog(this.title, this.content, this.voidCallback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: <Widget>[
        FlatButton(
          child: Text("Reset"),
          onPressed: voidCallback,
        )
      ],
    );
  }
}