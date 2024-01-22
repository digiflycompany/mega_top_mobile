import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

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
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.blackGreyColor,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.blackGreyColor
        ),
        selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex==0?AppAssets.homeSelectedIcon:AppAssets.homeUnselectedIcon,
            ),
            label: AppStrings.homeEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
               _currentIndex==1?AppAssets.categoriesSelectedIcon:AppAssets.categoriesUnselectedIcon,
            ),
            label: AppStrings.categoriesEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex==2?AppAssets.offersSelectedIcon:AppAssets.offersUnselectedIcon,
            ),
            label: AppStrings.offersEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex==3?AppAssets.cartSelectedIcon:AppAssets.cartUnselectedIcon,
            ),
            label: AppStrings.cartEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex==4?AppAssets.accountSelectedIcon:AppAssets.accountUnselectedIcon,
            ),
            label: AppStrings.accountEn,
          ),
        ],
      ),
    );
  }
}
