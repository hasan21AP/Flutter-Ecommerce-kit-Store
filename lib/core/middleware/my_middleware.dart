
import 'package:ecommerce_kit_store/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route){

    if (myServices.sharedPreferences.getString("Is Signed") == "yes"){
      return const RouteSettings(name: '/home');
    }
      return null;
  }
  

}