import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedPageWrapper extends StatelessWidget {
  const FeedPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(0),
      initialRoute: '/feed',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/feed':
            return GetPageRoute(
              page: () => const FeedPage(),
            );
          case '/feed/post':
            return GetPageRoute(
              page: () => const PostPage(),
            );
        }
        return null;
      },
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Post Page'),
          onPressed: () => Get.toNamed('/feed/post', id: 0),
        ),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Post Page'),
      ),
      body: const Center(
        child: Text(
          'See your post here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
