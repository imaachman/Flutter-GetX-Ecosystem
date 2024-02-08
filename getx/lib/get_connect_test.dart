import 'package:get/get.dart';

class Provider extends GetConnect {
  GetSocket connect() {
    return socket('wss://socketsbay.com/wss/v2/1/demo/');
  }

  void listen() {}
}
