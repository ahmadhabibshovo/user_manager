import 'package:flutter/material.dart';

class PaymentDialog {
  static final _textFieldController = TextEditingController();

  static Future<String?> showTextInputDialog(
      {required BuildContext context,
      required String username,
      String? value}) async {
    _textFieldController.text = value ?? '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('User :$username'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter $username Payment"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('Payment'),
                onPressed: () =>
                    Navigator.pop(context, _textFieldController.text),
              ),
            ],
          );
        });
  }
}
