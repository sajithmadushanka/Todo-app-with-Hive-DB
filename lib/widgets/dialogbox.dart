import 'package:flutter/material.dart';
import 'package:todoapp/widgets/buttons/elavatorbtn.dart';

// ignore: must_be_immutable
class MyDialog extends StatelessWidget {
  VoidCallback calback;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  MyDialog({super.key, required this.calback, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter',
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                ElavatorBtn(
                  text: 'Save',
                  callback: calback,
                ),
                const SizedBox(
                  width: 70,
                ),
                ElavatorBtn(text: 'Cancel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
