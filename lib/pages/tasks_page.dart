import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memento/data/database.dart';
import 'package:memento/util/dialog_box.dart';
import 'package:memento/util/task_tile.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String formattedTime = DateFormat.yMMMd().add_jm().format(now);

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, formattedTime.toString()]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161616),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF161616),
        title: const Text(
          "M e m e n t o",
          style: TextStyle(
              color: Color(0xFFECDBBA),
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor:
            const Color(0xFF161616), // Set background color to primary
        child: const Icon(
          Icons.add, // Or any other desired icon
          color: Color(0xFFECDBBA), // Set icon color to accent
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  taskName: db.toDoList[index][0],
                  taskTimer: db.toDoList[index][1],
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
