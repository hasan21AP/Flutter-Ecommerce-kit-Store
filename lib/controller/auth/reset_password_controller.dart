
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControlelr extends GetxController {

  changeState();
  resetPassword();
  goToSignInPage();
}

class ResetPasswordControlelrImpl extends ResetPasswordControlelr {

  GlobalKey<FormState> passwordState = GlobalKey<FormState>();
  bool passwordVisible = true;
  late TextEditingController password;

  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  changeState() {
    passwordVisible = !passwordVisible;
    update();
  }
  
  @override
  goToSignInPage() {
    Get.offAllNamed('/signIn');
    Get.deleteAll();
  }
  
  @override
  resetPassword() {
    var passwordData = passwordState.currentState;
    if (passwordData!.validate()){
      print('Valid');
      return true;
    }else {
      print('InValid');
      return false;
    }
  }
}