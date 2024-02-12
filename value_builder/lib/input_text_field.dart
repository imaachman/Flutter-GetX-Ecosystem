import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChanged;

  const InputTextField(
      {super.key,
      required this.textEditingController,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Enter text',
        border: OutlineInputBorder(),
      ),
    );
  }
}
