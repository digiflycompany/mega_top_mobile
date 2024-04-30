import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/pages/guest_account_screen.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/pages/user_account_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/cart_screen.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/pages/empty_cart_screen.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/pages/categories_screen.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_states.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/main_screen.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/pages/offers_screen.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final List<Widget> _pages = [
    const MainPage(),
    const CategoriesPage(),
    const OffersPage(),
    (PreferencesHelper.getToken()?.isNotEmpty ?? false) ? const CartPage() : const EmptyCartScreen(),
    (PreferencesHelper.getToken()?.isNotEmpty ?? false) ? const UserAccountScreen() : const GuestAccountScreen(),
  ];



  // @override
  // void dispose() {
  //   homeCubit.pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final homeCubit = context.read<HomeCubit>();
          return  PageView(
            controller: homeCubit.pageController,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                homeCubit.setPageIndex(index);
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: homeCubit.currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.blackGreyColor,
        onTap: homeCubit.onBottomNavItemChanged,
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
            icon: SvgPicture.asset(
              homeCubit.currentIndex == 0
                  ? AppAssets.homeSelectedIcon
                  : AppAssets.homeUnselectedIcon,
            ),
            label: AppStrings.homeEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeCubit.currentIndex == 1
                  ? AppAssets.categoriesSelectedIcon
                  : AppAssets.categoriesUnselectedIcon,
            ),
            label: AppStrings.categoriesEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeCubit.currentIndex == 2
                  ? AppAssets.offersSelectedIcon
                  : AppAssets.offersUnselectedIcon,
            ),
            label: AppStrings.offersEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeCubit.currentIndex == 3
                  ? AppAssets.cartSelectedIcon
                  : AppAssets.cartUnselectedIcon,
            ),
            label: AppStrings.cartEn,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeCubit.currentIndex == 4
                  ? AppAssets.accountSelectedIcon
                  : AppAssets.accountUnselectedIcon,
            ),
            label: AppStrings.accountEn,
          ),
        ],
      ),
    );
  }
}
