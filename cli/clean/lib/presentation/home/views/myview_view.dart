import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyviewView extends GetView {
  const MyviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
