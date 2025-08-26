import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';
import '../../core/themes/resource.dart';
import 'home_bottom_nav_bar_item.dart';

final class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

final class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: 0,
          selectedItemColor: AppColors.red,
          unselectedItemColor: AppColors.lightGrey,
          selectedLabelStyle: AppTextStyles.selectedTextSmall,
          unselectedLabelStyle: AppTextStyles.unselectedTextSmall,
          items: <BottomNavigationBarItem>[
            HomeBottomNavBarItem(
              label: 'Filmes',
              activeAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_FILME_NAV_BAR_INATIVO_PNG,
            ),
            HomeBottomNavBarItem(
              label: 'Favoritos',
              activeAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_HEART_BNB_INATIVO_PNG,
            ),
            HomeBottomNavBarItem(
              label: 'Perfil',
              activeAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_PNG,
              inactiveAsset: R.ASSETS_IMAGES_ICON_PROFILE_NAV_BAR_INATIVO_PNG,
            ),
          ],
        ),
      ),
    );
  }
}
