import 'package:flutter/material.dart';

import 'feed.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageView(pageController: pageController),
      bottomNavigationBar: HomePageNavBar(pageController: pageController),
    );
  }
}

class HomePageNavBar extends StatefulWidget {
  const HomePageNavBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<HomePageNavBar> createState() => _HomePageNavBarState();
}

class _HomePageNavBarState extends State<HomePageNavBar> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {
      setState(() {
        currentPage = widget.pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.feed),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) => widget.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        FeedPageWrapper(),
        ProfilePageWrapper(),
      ],
    );
  }
}
