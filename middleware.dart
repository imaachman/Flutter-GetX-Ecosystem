import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    return authController.authenticated || route == '/login'
        ? null
        : RouteSettings(name: '/login');
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    return super.redirectDelegate(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('>>> Page ${page?.name} called');
    print('>>> User ${authController.username} logged');
    return authController.username.isNotEmpty
        ? page?.copy(parameters: {'user': authController.username})
        : page;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // This function will be called right before the Bindings are initialize,
    // then bindings is null
    bindings = [OtherBinding()];
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    print('Bindings of ${page.toString()} are ready');
    return page;
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}

void main() {
  Get.put(AuthController());
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        middlewares: [GlobalMiddleware()],
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        binding: LoginBinding(),
        middlewares: [GlobalMiddleware()],
      ),
    ],
  ));
}

class AuthController extends GetxController {
  final _authenticated = false.obs;
  final _username = RxString('');

  bool get authenticated => _authenticated.value;
  set authenticated(value) => _authenticated.value = value;
  String get username => _username.value;
  set username(value) => _username.value = value;

  @override
  void onInit() {
    ever<bool>(_authenticated, (value) {
      if (value) {
        username = 'Eduardo';
      }
    });
    super.onInit();
  }
}

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherController());
  }
}

class OtherController extends GetxController {
  @override
  void onInit() {
    print('>>> OtherController started');
    super.onInit();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME')),
      body: Center(
        child: Text('User: ${Get.parameters['user']}'),
      ),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  @override
  void onInit() {
    print('>>> LoginController started');
    super.onInit();
  }

  AuthController get authController => Get.find<AuthController>();
}

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            controller.authController.authenticated = true;
            Get.offNamed('/home');
          },
        ),
      ),
    );
  }
}
