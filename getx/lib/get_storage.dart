import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    // box.listen(() {
    //   logCache();
    // });

    // box.listenKey('theme', (value) {
    //   updateTheme(value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    box.erase();

    box.remove('key');

    final name = ReadWriteValue('key', 'defaultValue');

    print('Name: ${name.val}');

    name.val = 'newName';

    print('Name: ${name.val}');

    // box.erase();

    // box.write('key1', 'value1');

    // box.writeInMemory('key2', 'value2');
    // box.write('key4', 'value4');
    // box.writeIfNull('key3', 'value3');

    // // box.remove('key2');

    // box.save();

    // // box.read('key');

    // print('Keys : ${box.getKeys()}');
    // print('Values : ${box.getValues()}');

    // print('Changes: ${box.changes}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
