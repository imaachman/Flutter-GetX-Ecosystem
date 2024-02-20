import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  Get.put(StorageService());
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class StorageService extends GetxService {
  // Future<void> initializeStorage() {
  //   return GetStorage.init();
  // }

  @override
  void onInit() {
    super.onInit();
    print('Service onInit');
    GetStorage.init();
  }

  // UserData getLocalUserData() {
  //   final box = GetStorage();
  //   final Map<String, dynamic> rawUserData = box.read('userData');
  //   return UserData.fromJson(rawUserData);
  // }

  // void setLocalUserData(UserData userData) {
  //   final box = GetStorage();
  //   box.write('userData', userData.toJson());
  // }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final StorageService storageService = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Boilerplate'),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
