import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Controller extends GetxController {
  final RxInt count = 0.obs;

  final RxString name = 'John Doe'.obs;

  final RxList<String> list = <String>[].obs;

  final RxMap<String, dynamic> map = <String, dynamic>{}.obs;

  final RxSet<String> sett = <String>{}.obs;

  final RxBool isTrue = true.obs;

  final RxDouble pi = 3.14159.obs;

  increment() {
    count.value++;

    sett.update((value) {});
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller controller = Get.put(Controller());

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
