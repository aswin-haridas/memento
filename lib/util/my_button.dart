import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text; // Use lowercase for variable names
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF161616),
      ),
      child: Text(text),
    );
  }
}
