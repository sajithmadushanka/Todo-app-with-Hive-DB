import 'package:hive/hive.dart';

class ToDoDB {
  List items = [];
  final _mybox = Hive.box('MyBox');

  void createInitData() {
    items = [
      ['first', false],
      ['second', false]
    ];
  }

  // loaddata from db
  void loadData() {
    items = _mybox.get('TODOLIST');
  }

  void update() {
    _mybox.put('TODOLIST', items);
  }
}
