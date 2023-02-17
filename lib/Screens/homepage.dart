import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/db.dart';

import '../widgets/buttons/button.dart';
import '../widgets/tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //referece to the box
  final _mybox = Hive.box('MyBox');
  final ToDoDB _db = ToDoDB();

  /// first open opp
  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      _db.createInitData();
    } else {
      _db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  int indexs = 0;
  void increament() {
    if (controller.text != '') {
      setState(() {
        _db.items.add([controller.text.trim().toString(), false]);
        controller.clear();
      });
      _db.update();
    }
  }

  void delete(int index) {
    setState(() {
      _db.items.removeAt(index);
    });
    _db.update();
  }

  // check box status
  bool status = false;
  void checkboxOnchanged(bool value, int index) {
    setState(() {
      _db.items[index][1] = !_db.items[index][1];
    });
    _db.update();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(title: const Text('MY TODO')),
      body: ListView.builder(
        itemCount: _db.items.length,
        itemBuilder: (context, index) {
          return MyLite(
            name: _db.items[index][0],
            taskState: _db.items[index][1],
            checkboxOnchanged: (value) => checkboxOnchanged(value, index),
            detete: (context) => delete(index),
          );
        },
      ),
      floatingActionButton: MyButton(
        callback: increament,
        controller: controller,
      ),
    );
  }
}
