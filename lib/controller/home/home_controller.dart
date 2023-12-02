
import 'package:ecommerce_kit_store/controller/auth/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {

  Future<void> logOut();
  goToSignInPage();
  sendEmailVerification();
  changeStateOfLoading();
  bool searchProduct();
  selectedIndex(int index);

}


class HomeControllerImpl extends HomeController {

  bool isLoading = true;
  GlobalKey<FormState> searchState = GlobalKey<FormState>();
  late TextEditingController search;
  int currentIndex = 0;


  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
  
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/sigIn');

  }
  
  @override
  Future<void> logOut() async{
    await GetAuthentication().logout();
  }
  

  @override
  sendEmailVerification() {
    GetAuthentication().sendLinkVeriyEmail();
  }
  
  @override
  changeStateOfLoading() {
    isLoading = !isLoading;
    update();
  }
  
  @override
  bool searchProduct() {
    var searchData = searchState.currentState;
    if (searchData!.validate()){
      return true;
    }else{
      return false;
    }
  }
  
  @override
  selectedIndex(int index) {
    currentIndex = index;
    update();
  }
}