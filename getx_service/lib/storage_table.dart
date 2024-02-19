import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_service/service.dart';

class StorageTable extends StatefulWidget {
  const StorageTable({super.key});

  @override
  State<StorageTable> createState() => _StorageTableState();
}

class _StorageTableState extends State<StorageTable> {
  final StorageService storageService = Get.find<StorageService>();

  @override
  void initState() {
    // Rebuild the widget when something is added or removed from storage.
    storageService.onStorageChange(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        for (final key in storageService.keys) ...[
          TableRow(
            children: [
              TableBox(text: key),
              TableBox(text: storageService.read(key) ?? ''),
              Container(
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: OutlinedButton(
                  child: const Text('Delete'),
                  onPressed: () => storageService.delete(key),
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
