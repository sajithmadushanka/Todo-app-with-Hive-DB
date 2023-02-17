import 'package:flutter/material.dart';

import '../dialogbox.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
   // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback callback;
 
  MyButton({super.key, required this.callback,required this.controller});

  void showD(context) {
    showDialog(
      context: (context),
      builder: (context) {
        return MyDialog(calback: callback, controller: controller,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: () {
          showD(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
