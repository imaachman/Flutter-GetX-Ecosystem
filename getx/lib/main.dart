import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
          routeInformationParser: GetInformationParser(),
          routerDelegate: Get.delegate<GetDelegate, >(),
        // home: HomePage(),
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () => Get.rootDelegate.pushHistory(GetNavConfig.fromRoute(route)),),);
  }
}
