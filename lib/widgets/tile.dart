import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/data/db.dart';

class MyLite extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final taskState;
  Function(bool?) checkboxOnchanged;
  Function(BuildContext)? detete;

  MyLite(
      {super.key,
      required this.name,
      checkboxOnchanged,
      required this.detete,
      this.taskState = 'false'})
      // ignore: avoid_types_as_parameter_names
      : checkboxOnchanged = checkboxOnchanged ?? ((bool) => () {});
  // db----------------------------
  ToDoDB _db = ToDoDB();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.

            motion: const ScrollMotion(),
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: detete,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              )
            ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(name,
                style: TextStyle(
                  decoration: taskState
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                )),
            leading: Checkbox(
              checkColor: Colors.black,
              value: taskState,
              onChanged: checkboxOnchanged,
            ),
          ),
        ),
      ),
    );
  }
}
