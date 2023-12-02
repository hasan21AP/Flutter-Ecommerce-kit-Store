import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: AppColors.kMainColor,
                inactiveColorPrimary: AppColors.kGrayColor,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: ("Explore"),
                activeColorPrimary: AppColors.kMainColor,
                inactiveColorPrimary: AppColors.kGrayColor
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.cart),
                title: ("Chart"),
                activeColorPrimary: AppColors.kMainColor,
                inactiveColorPrimary: AppColors.kGrayColor
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.person),
                title: ("Account"),
                activeColorPrimary: AppColors.kMainColor,
                inactiveColorPrimary: AppColors.kGrayColor
            ),
        ];
    }