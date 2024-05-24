import 'package:flutter/material.dart';

/// A stateless widget that displays the provided text.
class InputText extends StatelessWidget {
  final String text;

  const InputText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
    );
  }
}
