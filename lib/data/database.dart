import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Time Flies", "00:00"],
    ];
  }

  // Load the data from the database
  void loadData() {
    // Retrieve the data from the box and handle potential null case
    toDoList = _myBox.get("TODOLIST") ?? [];
  }

  // Update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
