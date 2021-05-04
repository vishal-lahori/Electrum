import 'package:flutter/material.dart';

void commonMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Electrum",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(message, style: TextStyle(fontWeight: FontWeight.w500)),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "OK",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo,
                  fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
