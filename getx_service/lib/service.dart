import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final GetStorage box = GetStorage();

  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  // Read data from the storage.
  String? read(String key) => box.read<String>(key);

  // Get all keys from the storage.
  Iterable get keys => box.getKeys();

  // Get all values from the storage.
  Iterable get values => box.getValues();

  // Write key-value pair into storage.
  // Notice how have set the data type of value to String. This lets us control
  // the type of data that we store in the storage through this class.
  void write(String key, String value) => box.write(key, value);

  // Delete a key-value pair from the storage.
  void delete(String key) => box.remove(key);

  // Clear all data from the storage.
  void deleteAll() => box.erase();

  // Listen to storage operations.
  VoidCallback onStorageChange(VoidCallback onChange) => box.listen(onChange);
}
