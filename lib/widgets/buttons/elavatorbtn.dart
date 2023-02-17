import 'package:flutter/material.dart';

import 'package:todoapp/widgets/tile.dart';

// ignore: must_be_immutable
class ElavatorBtn extends StatelessWidget {
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final contraller;
  VoidCallback callback;

  ElavatorBtn({super.key, this.text = '', this.contraller, callback})
      : callback = callback ?? (() {});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == 'Cancel') {
          btnChanges(context);
        } else {
          MyLite(
            name: contraller,
            detete: ((p0) => () {}),
          );
          callback();
          if (contraller.toString() != '') {
            btnChanges(context);
            print('es');
          }
        }
      },
      child: Text(text),
    );
  }

  void btnChanges(context) {
    Navigator.pop(context);
  }
}
