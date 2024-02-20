import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class DataProvider extends GetConnect {
  Future<Response> fetchData() =>
      get('https://jsonplaceholder.typicode.com/posts');

  Future<Response> postData() => post(
      'https://jsonplaceholder.typicode.com/posts',
      {'title': 'foo', 'body': 'bar', 'userId': 1});

  Future<Response> putData() => put(
      'https://jsonplaceholder.typicode.com/posts/1',
      {'id': 1, 'title': 'foo', 'body': 'bar', 'userId': 1});

  Future<Response> deleteData() =>
      delete('https://jsonplaceholder.typicode.com/posts/1');

  Future<Response> patchData() =>
      patch('https://jsonplaceholder.typicode.com/posts/1', {'title': 'foo'});

  Future<Response> fetchDataWithQuery() => query(
        'aachman',
        url: 'https://jsonplaceholder.typicode.com/posts',
        headers: {'key': 'value'},
      );
}

class DataController extends GetxController {
  final dataProvider = DataProvider();
  final posts = <Post>[].obs;

  late final GetConnect connect;

  late final GetSocket socket;

  @override
  void onInit() {
    // fetchPosts();
    super.onInit();

    connect = GetConnect();

    socket = connect.socket('https://echo.websocket.org/');

    socket.url = 'wss://echo.websocket.org/';
    socket.allowSelfSigned = false;
    socket.ping = Duration(seconds: 5);

    connectToSocket();

    socket.onOpen(() {
      print('socket opened');
    });

    socket.onMessage((data) {
      print('message: $data');
    });

    socket.on('event', (val) {
      print('EVENT RECIEVED: $val');
    });

    socket.onClose((close) {
      print('socket closed');
      close.message;
    });

    socket.onError((error) {
      print('Socket Error: $error');
    });
  }

  void connectToSocket() async {
    await socket.connect().then((value) => print('connected'));
  }

  void sendMessage() {
    socket.send('Hello');
  }

  void sendEvent() {
    socket.emit('event', 'Hello');
  }

  void fetchPosts() async {
    // connect.baseUrl = 'https://jsonplaceholder.typicode.com/todos/';
    // final response =
    //     await connect.get('https://jsonplaceholder.typicode.com/todos/1');

    // final Response response = await connect.post(
    //   'https://example.com/api/post',
    //   {
    //     'key1': 'value1',
    //     'key2': 'value2',
    //   },
    //   contentType: 'application/json',
    //   headers: {
    //     'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
    //   },
    //   query: {
    //     'key1': 'value1',
    //     'key2': 'value2',
    //   },
    //   uploadProgress: (percent) => updateProgressBar(percent),
    //   decoder: (data) => Post.fromJson(data),
    // );

    // final Response response = await connect.put(
    //   'https://jsonplaceholder.typicode.com/posts/1',
    //   {
    //     'id': 1,
    //     'title': 'foo',
    //     'body': 'bar',
    //     'userId': 1,
    //     'name': 'aachman',
    //   },
    // );

    // final Response response =
    //     await connect.delete('https://jsonplaceholder.typicode.com/posts/1');

    // final response = await connect.patch(
    //   'https://jsonplaceholder.typicode.com/posts/3',
    //   {
    //     'title': 'foo',
    //     'body': 'bar',
    //   },
    // );

    // connect.baseUrl = 'https://api.escuelajs.co/graphql';
    // connect.baseUrl = 'https://countries.trevorblades.com/';
    // final response = await connect.query(
    //   r"""
    //   {
    //     country(code: "BR") {
    //       name
    //       native
    //       currency
    //       languages {
    //         code
    //         name
    //       }
    //     }
    //   }
    //   """,
    //   url: '',
    // );

//     final response = await connect.mutation(
//       '''mutation {
//   addProduct(
//     data: {
//       title: "New Product"
//       price: 10
//       description: "A description"
//       categoryId: 1
//       images: ["https://placeimg.com/640/480/any"]
//     }
//   ) {
//     title
//     price
//     images
//     category {
//       id
//       name
//       image
//     }
//   }
// }''',
//       url: 'https://api.escuelajs.co/graphql',
//     );
    // final GraphQLResponse response = await connect.query(
    //   r"""
    //   query {
    //     products(categoryId: 1, price_min: 100, price_max: 1000) {
    //       title
    //       price
    //       images
    //       category {
    //         id
    //         name
    //         image
    //       }
    //     }
    //   }
    //   """,
    //   url: 'https://api.escuelajs.co/graphql',
    // );

    // response.body;
    // response.bodyBytes;
    // response.headers;
    // response.request;
    // response.status;
    // response.statusCode;
    // response.statusText;
    // response.unauthorized;
    // response.isOk;
    // connect.baseUrl = '';
    // connect.defaultDecoder = (map) => Post.fromJson(map);
    // final response =
    //     await connect.get('https://jsonplaceholder.typicode.com/posts');
    // if (response.status.hasError) {
    //   print('Error: ${response.statusText}');
    // } else {
    //   final data = response.body as List;
    //   posts.assignAll(data.map((e) => Post.fromJson(e)).toList());
    //   update();
    // }

    // socket.on('connect', (value) {
    //   print('socket connected');
    // });
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: GetBuilder<DataController>(
          init: DataController(),
          initState: (state) {},
          builder: (controller) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () => controller.sendMessage(),
                  child: Text('Send Message'),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.sendEvent(),
                  child: Text('Send Event'),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.socket.close(),
                  child: Text('Close Socket'),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.socket.dispose(),
                  child: Text('Dispose'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
