import 'package:flutter/material.dart';

class InputDialog {
  static final _textFieldController = TextEditingController();
  static Future<String?> showTextInputDialog(
      {required BuildContext context,
      required String item,
      String? value}) async {
    _textFieldController.text = value ?? '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('TODO'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter $item name"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () =>
                    Navigator.pop(context, _textFieldController.text),
              ),
            ],
          );
        });
  }
}
