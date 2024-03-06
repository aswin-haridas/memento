import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF161616),
      surfaceTintColor: Colors.transparent,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              onSubmitted: (value) => onSave(),
              style: const TextStyle(color: Colors.white),
              controller: controller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.grey)),
              cursorColor: const Color(0xFFECDBBA),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF161616),
                      foregroundColor: const Color(0xFFECDBBA),
                    ),
                    onPressed: onSave,
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF161616),
                      foregroundColor: const Color(0xFFECDBBA),
                    ),
                    onPressed: onCancel,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
