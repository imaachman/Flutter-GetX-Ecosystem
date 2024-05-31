import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

/// A widget that provides input fields to write key-value pairs into storage.
class StorageInput extends StatefulWidget {
  const StorageInput({super.key});

  @override
  State<StorageInput> createState() => _StorageInputState();
}

class _StorageInputState extends State<StorageInput> {
  // Controllers to access the key and value from the input fields.
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  // Initialize the 'users' storage box.
  final GetStorage box = GetStorage('users');

  @override
  void dispose() {
    // Dispose of controllers.
    keyController.dispose();
    valueController.dispose();
    super.dispose();
  }

  /// Writes the key-value pair into storage.
  void writeIntoStorage() {
    // Get the key and value from the input fields.
    final String key = keyController.text;
    final String value = valueController.text;
    // Both key and value should be filled.
    if (key.isNotEmpty && value.isNotEmpty) {
      // Write the key-value pair into storage.
      box.write(key, value);
      // Clear the input fields.
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
            // Write the key-value pair into storage when the user submits the
            // key.
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
            // Write the key-value pair into storage when the user submits the
            // value.
            onSubmitted: (value) => writeIntoStorage(),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.send),
          // Write the key-value pair into storage when the user taps the send
          // button.
          onPressed: () => writeIntoStorage(),
        ),
      ],
    );
  }
}
