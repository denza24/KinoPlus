import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';

Future<dynamic> showErrorDialog(BuildContext context, String? message) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Greška', style: TextStyle(color: darkPrimaryColor)),
        content: Text(message ?? 'Dogodila se greška.',
            style: const TextStyle(color: Colors.grey)),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
