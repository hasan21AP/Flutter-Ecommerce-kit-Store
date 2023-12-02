import 'package:ecommerce_kit_store/view/screens/home/home_screens/cart_screen_view.dart';
import 'package:ecommerce_kit_store/view/screens/home/home_screens/explore_screen_view.dart';
import 'package:ecommerce_kit_store/view/screens/home/home_screens/home_screen_view.dart';
import 'package:ecommerce_kit_store/view/screens/home/home_screens/profile_screen_view.dart';
import 'package:flutter/material.dart';

List<Widget> buildScreens() {
        return [
          const HomeScreenView(),
          const ExploreScreenView(),
          const CartScreenView(),
          const ProfileScreenView(),
        ];
    }