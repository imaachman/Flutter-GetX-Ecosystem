import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController with StateMixin<String> {
  void makeChange() {
    change('newState', status: RxStatus.success());
    append(() => getData);
    addListener(() {
      if (status.isLoadingMore) {}
    });
  }

  Future<String> getData() async {
    return '';
  }

  // Future<UserModel> fetchUser() async {
  //   try {
  //     // Loading
  //     change(null, status: RxStatus.loading());

  //     final http.Response response =
  //         await http.get(Uri.parse('https://users.database.com/user/1'));
  //     final data = jsonDecode(response.body);
  //     final UserModel user = UserModel(name: data['name'], age: data['age']);

  //     if (user.name.isEmpty) {
  //       change(null, status: RxStatus.empty());
  //     } else {
  //       // Success
  //       change(user, status: RxStatus.success());
  //     }

  //     return user;
  //   } catch (error) {
  //     // Error
  //     change(null, status: RxStatus.error(error));
  //   }
  // }

  // Future<String> keepGettingData() async {
  //   http.Response response = await http.get(Uri.parse('uri'));
  // }
}
