import 'package:flutter/material.dart';

class Dialogs {
  Dialogs._internal();

  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Hi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Please login before you start")
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: const Text("Confirm"))],
    );
  }
}
