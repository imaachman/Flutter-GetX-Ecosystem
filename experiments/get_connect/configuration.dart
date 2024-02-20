// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/request/request.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HTTPController extends GetConnect {
//   @override
//   void onInit() {
//     super.onInit();

//     httpClient.addAuthenticator((request) => null)

//     // allowAutoSignedCert = true;
//     // trustedCertificates = <TrustedCertificate>[];

//     // withCredentials = true;

//     // userAgent = 'MyCustomApp/1.0 (Android 11; SM-G991B Build/RP1A.200720.012)';
//     // sendUserAgent = true;

//     // baseUrl = 'https://jsonplaceholder.typicode.com';
//     // defaultContentType = 'application/json; charset=utf-8';
//     // defaultDecoder = (data) {};

//     // followRedirects = true;
//     // maxRedirects = 10;

//     // maxAuthRetries = 3;

//     // timeout = Duration(seconds: 10);

//     // findProxy = (url) => 'PROXY proxy.example.com:8080';

//     // sockets;

//     // httpClient;

//     // httpClient.addAuthenticator<Map?>(((request) async {
//     //   final response = await get("http://yourapi/token");
//     //   final token = response.body['token'];
//     //   // Set the header
//     //   request.headers['Authorization'] = "$token";
//     //   return request;
//     // }));

//     // FutureOr<Request<Map?>> requestModifier(Request<Map?> request) {
//     //   request.headers['Custom-Header'] = 'YourCustomValue';
//     //   return request;
//     // }

//     // httpClient.addRequestModifier<Map?>(requestModifier);

//     // httpClient.removeRequestModifier<Map?>(requestModifier);

//     // FutureOr responseModifier(Request<Map?> request, Response<Map?> response) {
//     //   // Modify the response
//     //   response.body?['modified'] = true;
//     //   return response;
//     // }

//     // httpClient.addResponseModifier<Map?>(responseModifier);

//     // httpClient.removeResponseModifier<Map?>(responseModifier);
//   }

//   void callApi() async {
//     final response = await get('https://jsonplaceholder.typicode.com/posts');
//     print(response.body);
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App'),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, Flutter!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
