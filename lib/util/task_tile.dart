import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String taskName;
  final String taskTimer;
  Function(BuildContext)? deleteFunction;

  TaskTile({
    super.key,
    required this.taskName,
    required this.taskTimer,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color(0xFFECDBBA),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: const Color(0x0F4E4E4E),
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              Text(
                taskName,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const Spacer(),
              Text(
                taskTimer,
                style: const TextStyle(fontSize: 18, color: Color(0xFFECDBBA)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
