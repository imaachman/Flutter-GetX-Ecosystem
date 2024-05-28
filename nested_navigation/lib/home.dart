import 'package:flutter/material.dart';

import 'feed.dart';
import 'profile.dart';

/// Home page with a bottom navigation bar and a page view.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // The page controller for the page view.
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageView(pageController: pageController),
      bottomNavigationBar: HomePageNavBar(pageController: pageController),
    );
  }
}

/// Bottom navigation bar with two items: Feed and Profile.
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
  // The current page index.
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Listen to the page controller and update the current page index.
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
      // On tap of an item, animate to the corresponding page in the page view.
      onTap: (index) => widget.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }
}

/// Page view with two pages: Feed and Profile.
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
