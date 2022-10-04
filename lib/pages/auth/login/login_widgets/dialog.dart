import 'package:flutter/material.dart';

Widget dialog(
  context, {
  required String title,
  String? content,
}) {
  return AlertDialog(
    title: Text(title),
    content: Text(content ?? 'Some of the credentials are empty'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
      ),
    ],
  );
}
