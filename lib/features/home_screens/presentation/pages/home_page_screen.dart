import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/pages/guest_account_screen.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/pages/user_account_screen.dart';
import 'package:mega_top_mobile/features/brands/presentation/pages/brands_page.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/cart_screen.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/pages/categories_screen.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/main_screen.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/pages/offers_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late Future<bool> _isUserLoggedInFuture;

  Future<bool> _checkIfUserLoggedIn() async {
    final token = await PreferencesHelper.getToken();
    return token != null;
  }

  @override
  void initState() {
    super.initState();
    _isUserLoggedInFuture = _checkIfUserLoggedIn();
  }

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
    HomeCubit homeCubit = context.read<HomeCubit>();
    return FutureBuilder<bool>(
        future: _isUserLoggedInFuture,
        builder: (context, snapshot) {
          final isUserLoggedIn = snapshot.data ?? false;
          final List<Widget> _pages = [
            const MainPage(),
            const CategoriesPage(),
            const BrandsPage(),
            const OffersPage(),
            const CartPage(),
            isUserLoggedIn
                ? const UserAccountScreen()
                : const GuestAccountScreen()
          ];
          return Scaffold(
              body: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return PageView(
                        controller: _pageController,
                        children: _pages,
                        onPageChanged: (index) {
                          setState(() {
                            homeCubit.setPageIndex(_currentIndex = index);
                          });
                        });
                  }),
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.blackGreyColor,
                  onTap: _onItemTapped,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackGreyColor),
                  selectedLabelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 0
                            ? AppAssets.homeSelectedIcon
                            : AppAssets.homeUnselectedIcon),
                        label: AppLocalizations.of(context)!.homeNavBar),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 1
                            ? AppAssets.categoriesSelectedIcon
                            : AppAssets.categoriesUnselectedIcon),
                        label: AppLocalizations.of(context)!.categories),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 2
                            ? AppAssets.categoriesSelectedIcon
                            : AppAssets.categoriesUnselectedIcon),
                        label: AppLocalizations.of(context)!.brands),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 3
                            ? AppAssets.offersSelectedIcon
                            : AppAssets.offersUnselectedIcon),
                        label: AppLocalizations.of(context)!.offers),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 4
                            ? AppAssets.cartSelectedIcon
                            : AppAssets.cartUnselectedIcon),
                        label: AppLocalizations.of(context)!.cart),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(_currentIndex == 5
                            ? AppAssets.accountSelectedIcon
                            : AppAssets.accountUnselectedIcon),
                        label: AppLocalizations.of(context)!.account)
                  ]));
        });
  }
}