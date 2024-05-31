import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Service class to interact with the storage.
/// It provides methods to read, write, delete, and listen to storage
/// operations, effectively encapsulating the storage logic.
class StorageService extends GetxService {
  /// Instantiate the storage box.
  final GetStorage box = GetStorage();

  /// Initializes the storage box and returns the service instance.
  Future<StorageService> init() async {
    // Initialize the storage box.
    await GetStorage.init();
    return this;
  }

  /// Reads data from the storage.
  String? read(String key) => box.read<String>(key);

  /// Returns all keys from the storage.
  Iterable get keys => box.getKeys();

  /// Returns all values from the storage.
  Iterable get values => box.getValues();

  /// Writes a key-value pair into the storage.
  /// Notice how we have set the data type of value to String. This lets us
  /// control the type of data that we store in the storage through this class.
  /// That's just an example. We can have elaborate logic before we actually
  /// write into the storage.
  void write(String key, String value) => box.write(key, value);

  /// Deletes a key-value pair from the storage.
  void delete(String key) => box.remove(key);

  /// Clears all data from the storage.
  void deleteAll() => box.erase();

  /// Listen to storage operations.
  VoidCallback onStorageChange(VoidCallback onChange) => box.listen(onChange);
}
