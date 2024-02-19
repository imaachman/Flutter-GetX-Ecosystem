import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageTable extends StatefulWidget {
  const StorageTable({super.key});

  @override
  State<StorageTable> createState() => _StorageTableState();
}

class _StorageTableState extends State<StorageTable> {
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
        for (final key in keys) ...[
          TableRow(
            children: [
              TableBox(text: key),
              TableBox(text: box.read(key).toString()),
              Container(
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: OutlinedButton(
                  child: const Text('Delete'),
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
