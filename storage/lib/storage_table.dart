import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// A table that displays all the key-value pairs stored in the storage,
/// specifically the 'users' storage box. It also provides a button next to
/// each key-value pair to delete the pair from the storage.
class StorageTable extends StatefulWidget {
  const StorageTable({super.key});

  @override
  State<StorageTable> createState() => _StorageTableState();
}

class _StorageTableState extends State<StorageTable> {
  // Initialize the 'users' storage box.
  final GetStorage box = GetStorage('users');

  @override
  void initState() {
    // Rebuild the widget when something is added or removed from storage.
    box.listen(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get all storage keys.
    final keys = box.getKeys();

    return Table(
      children: [
        TableRow(
          children: [
            TableBox(
              text: 'Key',
              style: Get.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TableBox(
              text: 'Value',
              style: Get.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(),
          ],
        ),
        // Display all key-value pairs in the storage.
        for (final key in keys) ...[
          TableRow(
            children: [
              // Display the key.
              TableBox(text: key),
              // Display the value by reading the key from storage.
              TableBox(text: box.read(key).toString()),
              Container(
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: OutlinedButton(
                  child: const Text('Delete'),
                  // Delete the key-value pair from storage.
                  onPressed: () => box.remove(key),
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}

/// A table cell that displays the text in the center with a border around it.
class TableBox extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TableBox({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: style ?? Get.textTheme.labelSmall?.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
