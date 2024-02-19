import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageInput extends StatefulWidget {
  const StorageInput({super.key});

  @override
  State<StorageInput> createState() => _StorageInputState();
}

class _StorageInputState extends State<StorageInput> {
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  final GetStorage box = GetStorage('users');

  @override
  void dispose() {
    keyController.dispose();
    valueController.dispose();
    super.dispose();
  }

  // Write key-value pair into storage.
  void writeIntoStorage() {
    final String key = keyController.text;
    final String value = valueController.text;
    if (key.isNotEmpty && value.isNotEmpty) {
      box.write(key, value);
      keyController.clear();
      valueController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextField(
            controller: keyController,
            decoration: const InputDecoration(
              hintText: 'Enter Key',
            ),
            onSubmitted: (value) => writeIntoStorage(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: valueController,
            decoration: const InputDecoration(
              hintText: 'Enter Value',
            ),
            onSubmitted: (value) => writeIntoStorage(),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => writeIntoStorage(),
        ),
      ],
    );
  }
}
