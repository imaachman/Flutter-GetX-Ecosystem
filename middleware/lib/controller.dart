import 'package:get/get.dart';

class Controller extends GetxController {
  final RxString userName = ''.obs;

  final RxBool isLoggedIn = true.obs;

  final RxBool allowAdminAccess = false.obs;

  final RxBool setDarkMode = false.obs;

  final RxBool showAds = false.obs;

  final RxBool disconnect = false.obs;
}

class AdminController extends GetxController {}
