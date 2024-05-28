import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A wrapper around the feed page that implements its own local navigation
/// stack. This allows the feed page to navigate to the post page without
/// affecting the global navigation stack.
class FeedPageWrapper extends StatelessWidget {
  const FeedPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a nested navigator to manage the local navigation stack.
    return Navigator(
      // Use [Get.nestedKey] to create a unique key for the nested navigator.
      key: Get.nestedKey(0),
      // Define '/feed' as the initial route.
      initialRoute: '/feed',
      // Define the routes for the nested navigator by mapping paths to pages.
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

/// Feed page that can navigate to the post page.
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
          // Navigate to the post page using the nested navigator with ID 0.
          onPressed: () => Get.toNamed('/feed/post', id: 0),
        ),
      ),
    );
  }
}

/// Post page.
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
