import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const Center(child: Text('Item 1 Content')),
    const Center(child: Text('Item 2 Content')),
    const Center(child: Text('Item 3 Content')),
    const Center(child: Text('Item 4 Content')),
    const Center(child: Text('Item 5 Content')),
  ];

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeUnselectedIcon,
            ),
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
               AppAssets.categoriesUnselectedIcon,
            ),
            label: 'Item 2',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.offersUnselectedIcon,
            ),
            label: 'Item 3',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.cartUnselectedIcon,
            ),
            label: 'Item 4',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.accountUnselectedIcon,
            ),
            label: 'Item 5',
          ),
        ],
      ),
    );
  }
}
