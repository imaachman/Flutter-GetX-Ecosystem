import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Service extends GetxService {
  final GetStorage _box = GetStorage('Settings');

  String? get name => _box.read<String>('name');
  set name(String? name) => _box.write('name', name);

  String? get color => _box.read<String>('color');
  set color(String? color) => _box.write('color', color);

  Future<Service> initStorage() async {
    await GetStorage.init('Settings');
    return this;
  }
}
