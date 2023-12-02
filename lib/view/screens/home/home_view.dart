import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:ecommerce_kit_store/controller/home/home_controller.dart';
import 'package:ecommerce_kit_store/data/model/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import 'package:ecommerce_kit_store/view/widgets/home/home_bod_not_verified.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screens/home_screen_view.dart';

Widget? body(bool? emailVerified){
  if (emailVerified == true){
    return const HomeScreenView();
  }else if (emailVerified == false){
    return const HomeBodyNotVerified();
  }else {
    return const HomeBodyNotVerified();
  }
} 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    GetAuthentication getAuthentication = GetAuthentication();
    print('Email Verified: ${getAuthentication.emailVerified}');
    return const BottomNavigationBarModel();
  }
}