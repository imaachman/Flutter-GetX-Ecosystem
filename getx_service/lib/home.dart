import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_service/service.dart';

import 'storage_input.dart';
import 'storage_table.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final StorageService storageService = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxService Demo'),
      ),
      body: Center(
        child: Container(
          width: context.widthTransformer(dividedBy: 1.5),
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              StorageTable(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: StorageInput(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Delete all data',
        // Clear all data from the storage.
        onPressed: () => storageService.deleteAll(),
        child: const Icon(Icons.delete),
      ),
    );
  }
}
